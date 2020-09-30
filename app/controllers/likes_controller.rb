class LikesController < ApplicationController
    skip_before_action :authorized


    def destroy
        @like = Like.find(params[:id])
        @like.destroy
    end
end
