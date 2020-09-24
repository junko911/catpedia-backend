class Cat < ApplicationRecord
  def self.search(category_id=nil, breed_id=nil)
    limit = 10
    if category_id
      api_url = "https://api.thecatapi.com/v1/images/search?limit=#{limit}&category_ids=#{category_id}"
    elsif breed_id
      api_url = "https://api.thecatapi.com/v1/images/search?limit=#{limit}&breed_id=#{breed_id}"
    else
      api_url = "https://api.thecatapi.com/v1/images/search?limit=#{limit}"
    end

    response = Faraday.get api_url
    result = JSON.parse(response.body)
  end

  def self.categories
    api_url = "https://api.thecatapi.com/v1/categories"

    response = Faraday.get api_url
    result = JSON.parse(response.body)
  end
end
