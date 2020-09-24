class CatsController < ApplicationController
  def index
    category_id = params[:category_id].present? ? params[:category_id] : nil
    byebug
    cats = Cat.search(category_id.to_i)
    render json: cats
  end

  def categories
    categories = Cat.categories
    render json: categories
  end
end
