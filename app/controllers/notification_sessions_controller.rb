class NotificationSessionsController < ApplicationController
    def create
        
        # @recipient = User.first
        n = Notification.create(recipient_id: "1", actor_id: "1", action: 'friend request', notifiable_id: "1", notifiable_type: "User")
        puts "nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn.errors"
        puts n.errors
        redirect_to users_path
    end
end
