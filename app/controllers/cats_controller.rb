class CatsController < ApplicationController
  def index
    category_id = params[:category_id].present? ? params[:category_id].to_i : nil
    breed_id = params[:breed_id].present? ? params[:breed_id] : nil
    byebug
    cats = Cat.search(category_id, breed_id)
    render json: cats
  end

  def categories
    categories = Cat.categories
    render json: categories
  end
end
