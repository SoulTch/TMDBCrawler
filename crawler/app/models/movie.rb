class Movie < SimpleRecord
  set_crawl 		 "/movie/%d"
  set_crawl_all	 "movie"
  set_update "movie"

  has_many :movie_credits
  has_many :people, through: :movie_credits

  def to_s
    return "#{release_date} : #{title}"
  end

  def to_col
    return {link: "/movie/#{id}", content: to_s}
  end
end