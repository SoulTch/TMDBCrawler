class Tv < SimpleRecord
  has_many :tv_seasons
  has_many :tv_episodes

  has_many :tv_credits
  has_many :people, through: :tv_credits

  set_crawl "/tv/%d", (Proc.new do |obj, json|
    json["seasons"].each do |col| 
      TvSeason.crawl [obj["id"], col["season_number"]], [obj.tv_seasons]
    end
  end)
  set_crawl_all 	"tv_series"
  set_update "tv"


  def to_s
    return "#{name}"
  end
  def to_col
    return {link: "/tv/#{id}", content: to_s}
  end
end
