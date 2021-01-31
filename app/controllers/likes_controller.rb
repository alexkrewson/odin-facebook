class LikesController < ApplicationController

    def create

        Like.create(user_id: current_user.id, post_id: params[:like][:post_id])

    end

end
