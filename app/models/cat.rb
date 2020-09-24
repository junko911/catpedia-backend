class Cat < ApplicationRecord
  def self.search
    api_url = "https://api.thecatapi.com/v1/images/search?"

    limit = 10
    response = Faraday.get "#{api_url}limit=#{limit}"
    result = JSON.parse(response.body)
  end

  def self.categories
    api_url = "https://api.thecatapi.com/v1/categories"

    response = Faraday.get api_url
    result = JSON.parse(response.body)
  end
end
