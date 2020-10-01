class Api::V1::BreedsController < ApplicationController
  skip_before_action :authorized

  def index
    breeds = Breed.breeds
    render json: breeds
  end
end
