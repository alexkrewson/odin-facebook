class NotificationsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_notifications

    def new
        
    end

    def index
        @notifications = Notification.where(recipient_id: current_user.id)
    end

    def create
        puts "notifications controller paraaaaaaaaaaaaaaaaaaaaaaaaaaaaams"
        puts params
        puts "notifications controller paraaaaaaaaaaaaaaaaaaaaaaaaaaaaams"
        @recipient_id = params[:notification][:recipient_id]
        @actor_id = params[:notification][:actor_id]

        
        Notification.create(recipient_id: @recipient_id, actor_id: @actor_id, action: 'friend request', notifiable_id: "1", notifiable_type: "User")
        redirect_to users_path
    end


    private

    def set_notifications
        @notifications = Notification.where(recipient: current_user).unread
    end

  
end
