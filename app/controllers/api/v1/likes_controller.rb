class Api::V1::LikesController < ApplicationController
    def destroy
        like = Like.all.find {|e| e.cat.api_id == params[:id] && e.user.id === current_user.id}
        like.destroy
        render json: {}
    end
end
