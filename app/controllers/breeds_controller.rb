class BreedsController < ApplicationController
  def index
    breeds = Breed.breeds
    render json: breeds
  end
end
