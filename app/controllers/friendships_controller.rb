class FriendshipsController < ApplicationController
    def new
        @friendship = Friendship.new

    end

    def create

        
        @friendship = Friendship.new(user_id: params[:friendship][:user_id], friend_id: params[:friendship][:friend_id])
        # puts "@frieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeenship"
        # puts @friendship
        @friendship.save

        @oldnotification = Notification.find(params[:friendship][:notification_id])
        @oldnotification.delete
     
        # puts "@frieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeenship saved"
        
        
        
        # respond_to do |format|
        #   if @friendship.save
        #     format.html { redirect_to root_path, notice: 'Friendship was successfully created.' }
        #     format.json { render :show, status: :created, location: @friendship }
        #   else
        #     format.html { render :new }
        #     format.json { render json: @friendship.errors, status: :unprocessable_entity }
        #   end
        # end
        redirect_to notifications_path
      end



      private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :notification_id)
    end

end
