class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected
  def self.limit
	if ENV["LIMIT"] then
	  return ENV["LIMIT"].to_i
	else
	  return 10**10
	end
  end

  protected
  def self.api_key
    ENV["APIKEY"]
  end
end
