class CreditRecord < ApplicationRecord
  self.abstract_class = true
  
  protected
  def self.subtitute(str, obj)
    res = ''
    state = false
    qur = ''
    for i in (0...str.length) do
      if str[i] == '{' then
        state = true
      elsif str[i] == '}' then
        state = false
        res += obj[qur].to_s
        qur = ''
      else
        if state then
          qur += str[i]
        else
          res += str[i]
        end
      end
    end

    return res
  end
  
  protected
  def self.set_crawl_credit(query_url, motherclass)
    define_singleton_method :crawl_credit do
      self.delete_all
      credit_type = ["cast", "crew", "guest_stars"]
      need_key	= ["character", "department", "job"]

      motherclass.all.each do |x|
        url = "https://api.themoviedb.org/3%s/credits?api_key=%s" % [subtitute(query_url, x), api_key]
        res = JSON.parse(open(url).read)

        credit_type.each do |credit|
          if res.key? credit then
            res[credit].each do |y|
              obj = self.new
              obj.type = credit
              con = {}

              y.each do |key, val|
                if need_key.include? key
                  con[key] = val
                end
              end

              obj.role = JSON.generate(con)
              x.send(self.model_name.plural) << obj
              
              begin
                rec = Person.find(y["id"])
                rec.send(self.model_name.plural) << obj if rec

                obj.save
              rescue
              end
              
            end
          end
        end
      end
    end
  end
end