class TvSeason < SimpleRecord
  belongs_to :tv
  has_many :tv_episodes
  has_many :tv_season_credits
  has_many :people, through: :tv_season_credits

  set_crawl "/tv/%d/season/%d", (Proc.new do |obj, json|
    json["episodes"].each do |col| 
      TvEpisode.crawl [obj.tv["id"], obj["season_number"], col["episode_number"]], [obj.tv.tv_episodes, obj.tv_episodes]
    end
  end)


  def to_s
    return "#{name} : #{season_number}"
  end
  def to_col
    return {link: "/tv/#{tv_id}/season/#{season_number}", content: to_s}
  end
end
