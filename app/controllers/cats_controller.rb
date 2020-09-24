class CatsController < ApplicationController
  def index
    cats = Cat.search
    render json: cats
  end

  def categories
    categories = Cat.categories
    render json: categories
  end
end
