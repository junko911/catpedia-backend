class Api::V1::LikesController < ApplicationController
    skip_before_action :authorized

    def destroy
        like = Like.all.find {|e| e.cat.api_id == params[:id]}
        like.destroy
        render json: {}
    end
end
