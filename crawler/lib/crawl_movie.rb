#Movie.crawl_all

if ARGV.length == 0 then
    Movie.crawl_all
elsif ARGV[0] == "update"
    Movie.crawl_update
else
    Movie.crawl ARGV[0].to_i
end