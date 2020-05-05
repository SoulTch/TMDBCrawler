class TvSeasonCredit < CreditRecord
  belongs_to :tv_season
  belongs_to :person
  
  set_crawl_credit "/tv/{tv_id}/season/{season_number}", TvSeason
end
