class TvEpisodeCredit < CreditRecord
	belongs_to :tv_episode
	belongs_to :person
	set_crawl_credit "/tv/{tv_id}/season/{season_number}/episode/{episode_number}", TvEpisode
end
