class TvEpisode < SimpleRecord
	set_crawl "/tv/%d/season/%d/episode/%d"

	belongs_to :tv_season
	belongs_to :tv

	has_many :tv_episode_credits
	has_many :people, through: :tv_episode_credits
	
	def to_s
		return "#{name} : #{season_number} : #{episode_number}"
	end
	def to_col
		return {link: "/tv/#{tv_id}/season/#{season_number}/episode/#{episode_number}", content: to_s}
	end
end
