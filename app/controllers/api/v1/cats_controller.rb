class Api::V1::CatsController < ApplicationController
  before_action :authorized, only: [:cat_fav, :user_favs]

  def index
    category_id = params[:category_id].present? ? params[:category_id].to_i : nil
    breed_id = params[:breed_id].present? ? params[:breed_id] : nil
    cats = Cat.search(category_id, breed_id)
    render json: cats
  end

  def user_favs
    favorite_cats = @user.cats
    render json: favorite_cats.to_json
  end

  def create
    name = params[:file].original_filename
    name = "#{rand(1000..9999)}_#{name}"

    path = File.join("public", "uploads", name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }

    cat = Cat.create(url: "http://localhost:3000/uploads/#{name}", api_id: name.split('.')[0])
    Like.create(cat: cat, user: current_user)

    render json: { url: "http://localhost:3000/uploads/#{name}" }
  end

  def cat_fav
    cat = Cat.find_or_create_by(cat_params)
    Like.create(cat: cat, user: @user)
    render json: cat
  end

  def categories
    categories = Cat.categories
    render json: categories
  end
end

private

def cat_params
  params.require(:cat).permit(:url, :api_id)
end


