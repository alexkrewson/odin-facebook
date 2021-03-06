class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_many :posts, dependent: :destroy

  has_many :friendships

  has_many :friends, through: :friendships

  has_many :friends, through: :friendships, foreign_key: "user_id"

  has_many :notifications, foreign_key: :recipient_id

  has_many :comments, dependent: :destroy

  has_one_attached :avatar


  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  # def self.find_or_create_by_omniauth(auth)
  #         user = User.find_by(provider: 'provider', uid: ':uid')

  #         unless user
  #           user = User.create(
  #             user.email = auth.info.email
  #             user.password = Devise.friendly_token[0,20]
  #             user.name = auth.info.name   # assuming the user model has a name
  #             user.image = auth.info.image # assuming the user model has an image
  #             )
  #         end
  #         user
  # end
  
  
end
