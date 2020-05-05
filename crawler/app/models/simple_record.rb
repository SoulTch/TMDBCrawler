require 'open-uri'
require 'zlib' 
require 'json'
require 'set'

class SimpleRecord < ApplicationRecord
  self.abstract_class = true

  def create_or_replace
    rec = self.class.find_by_id(id)
    if rec then
      attributes.each do |key, val|
        rec.update({key => val}) if key != "created_at" and key != "updated_at"
      end
    else
      save
    end
  end

  protected
  def self.set_crawl(query_url, block = nil)
    define_singleton_method :crawl do |query_param, abx = []|
      query = query_url % query_param
      url = "https://api.themoviedb.org/3%s?api_key=%s" % [query, api_key]

      res = JSON.parse(open(url).read)
      obj = self.new()

      res.each do |key, val| 
        if obj.respond_to?(key)
          obj[key] = val
        end
      end

      abx.each do |x| 
        x << obj
      end
      block.call obj, res if block

      obj.create_or_replace
    end
  end

  protected
  def self.set_crawl_all(export_name = name)
    define_singleton_method :crawl_all do 
      self.delete_all
      UpdateHistory.get_last_update(name)

      dat = Time.now
      begin
        url = 'http://files.tmdb.org/p/exports/%s_ids_%02d_%02d_%04d.json.gz' % [export_name, dat.month, dat.day, dat.year]
        gz = Zlib::GzipReader.new(open(url))
      rescue
        dat -= 60*60*24
        retry
      end

      cnt = 100000000000
      gz.each_line do |x|
        if cnt > 0 then
          crawl [JSON.parse(x)["id"]]
          cnt -= 1
        end
      end
    end
  end

  protected
  def self.set_update(name)
    define_singleton_method :crawl_update do
      last = UpdateHistory.get_last_update(name) - 24*60*60
      curr = Time.now + 24*60*60

      start_time  = last.utc.strftime('%Y-%m-%d')
      end_time	= curr.utc.strftime('%Y-%m-%d')

      base_url = "https://api.themoviedb.org/3/#{name}/changes?api_key=#{api_key}&start_date=#{start_time}&end_date=#{end_time}&page=%d"
      url = base_url % [1]
      res = JSON.parse(open(url).read)

      cnt = 100000000000
      for i in (1..res["total_pages"]) do
        if i > 1 then
          url = base_url % [i]
          res = JSON.parse(open(url).read)
        end

        res["results"].each do |x|
          if cnt > 0 then
            crawl x["id"]
            cnt -= 1
          end
        end
      end
    end
  end
end
