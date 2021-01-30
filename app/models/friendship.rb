class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"

  after_create :create_inverse_friendship


  def create_inverse_friendship

    friend1 = User.find(Friendship.last.user_id)

    friend2 = User.find(Friendship.last.friend_id)

    unless friend2.friends.where(id: friend1.id).exists?
      Friendship.create(user_id: friend2.id, friend_id: friend1.id)
    end

  end

end
