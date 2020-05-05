class TvCredit < CreditRecord
	belongs_to :tv
	belongs_to :person
	set_crawl_credit "/tv/{id}", Tv
end
