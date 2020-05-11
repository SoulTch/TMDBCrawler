#Movie.crawl_all

if ARGV.length == 0 then
	Person.crawl_all
elsif ARGV[0] == "update"
	Person.crawl_update
else
	Person.crawl ARGV[0].to_i
end