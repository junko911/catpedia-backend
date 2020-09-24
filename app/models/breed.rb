class Breed < ApplicationRecord
  def self.breeds
    api_url = "https://api.thecatapi.com/v1/breeds"

    response = Faraday.get api_url
    result = JSON.parse(response.body)
  end
end
