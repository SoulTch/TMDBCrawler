require 'open-uri'
require 'json'

module Tools 
	def callthis
		puts "wow"
	end

	def download(url) 
		return open(url).read
	end

	def download_json(url)
		return JSON.parse(download(url))
	end
end