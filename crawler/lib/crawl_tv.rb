#Movie.crawl_all

if ARGV.length == 0 then
	Tv.crawl_all
elsif ARGV == "update"
	Tv.crawl_update
else
	Tv.crawl ARGV[0].to_i
end