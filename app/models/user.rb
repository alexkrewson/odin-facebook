class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  has_many :friendships

  has_many :friends, through: :friendships

  has_many :friends, through: :friendships, foreign_key: "user_id"

  has_many :notifications, foreign_key: :recipient_id

  has_many :comments, dependent: :destroy

  has_one_attached :avatar
  
end
