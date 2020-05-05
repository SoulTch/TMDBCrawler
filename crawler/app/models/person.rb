class Person < SimpleRecord
  set_crawl 		"/person/%d"
  set_crawl_all 	 "person"
  set_update "person"


  has_many :movie_credits
  has_many :movies, through: :movie_credits
  has_many :tv_credits
  has_many :tvs, through: :tv_credits
  has_many :tv_season_credits
  has_many :tv_seasons, through: :tv_season_credits
  has_many :tv_episode_credits
  has_many :tv_episodes, through: :tv_episode_credits

  def to_s
    return "#{name}"
  end
  def to_col
    return {link: "/people/#{id}", content: to_s}
  end
end
