class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  protected
  def self.api_key
	ENV["APIKEY"]
  end
end
