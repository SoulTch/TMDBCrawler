class MovieCredit < CreditRecord
	belongs_to :movie
	belongs_to :person
	set_crawl_credit "/movie/{id}", Movie
end
