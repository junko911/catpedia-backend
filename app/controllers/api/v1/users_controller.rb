class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :cats, :index]
   
    def profile
      render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def cats
      @user= User.find(id_params)
      user_cats= @user.cats
      render json: user_cats
    end
   
    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def update
      name = params[:avatar].original_filename
      name = "#{rand(1000..9999)}_#{name}"

      path = File.join("public", "uploads", name)
      File.open(path, "wb") { |f| f.write(params[:avatar].read) }

      user = User.find(params[:id])
      user.update(avatar: "http://localhost:3000/uploads/#{name}")
      user.save
      render json: user
    end

    def index
      if current_user
        users = User.all.filter{|user| user.id != current_user.id}
      else
        users = User.all
      end
      render json: users
    end
  
    def follow
      user = User.find(params[:id])
      follow = Relationship.create(follower: user, followed: current_user)
      render json: follow
    end

    def unfollow
      user = User.find(params[:id])
      relationship = Relationship.find_by(follower: user, followed: current_user)
      relationship.destroy
      render json: {}
    end

    private
  
    def user_params
      params.require(:user).permit(:username, :name, :bio, :password, :avatar)
    end

    def id_params
      params.require(:id)
    end

  end
