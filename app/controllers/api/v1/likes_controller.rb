class Api::V1::LikesController < ApplicationController
    skip_before_action :authorized

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        render json: @like
    end
end
