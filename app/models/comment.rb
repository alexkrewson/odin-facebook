class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user

    after_create :create_notifications

    private

    def recipient
        Comment.last.post.user
    end

    def create_notifications
        Notification.create(recipient: recipient, actor: self.user,
            action: 'posted', notifiable: self)
       
    end

end
