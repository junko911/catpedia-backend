class CatsController < ApplicationController
  before_action :authorized, only: [:cat_fav, :user_fav]


  def index
    category_id = params[:category_id].present? ? params[:category_id].to_i : nil
    breed_id = params[:breed_id].present? ? params[:breed_id] : nil
    cats = Cat.search(category_id, breed_id)
    render json: cats
  end

  def user_favs

  end

  def create
    name = params[:file].original_filename

    name = "#{rand(1000..9999)}_#{name}"

    path = File.join("public", "uploads", name)
    File.open(path, "wb") { |f| f.write(params[:file].read) }

    Cat.create(image: "http://localhost:3000/uploads/#{name}")

    render json: { url: "http://localhost:3000/uploads/#{name}" }
  end

  def cat_fav
    Cat.create(cat_params)
    Like.create(cat_id: cat_params[:cat_id], user_id: @user.id)
  end

  def categories
    categories = Cat.categories
    render json: categories
  end
end

private

def cat_params
  params.require(:cat).permit(:image, :cat_id)
end
