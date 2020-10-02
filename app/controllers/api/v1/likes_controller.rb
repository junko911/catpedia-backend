class Api::V1::LikesController < ApplicationController
    skip_before_action :authorized

    def destroy
        like = Like.all.find {|e| e.cat.api_id == params[:id]}
        like.destroy
        cat = Cat.all.find {|e| e.api_id == params[:id]}
        cat.destroy
        render json: {}
    end
end
