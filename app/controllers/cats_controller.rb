class CatsController < ApplicationController
  def index
    cats = Cat.search
    render json: cats
  end
end
