class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    skip_before_action :verify_authenticity_token, only: :facebook

    

  
  

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "made it thiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiis far"

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      puts "eeeeeeeeeeroooooooooooooooooooooooooooooooors"
      puts @user.errors.details
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  def action_missing(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def create

      @user = User.create(sign_up_params)
      puts "user creaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaated"
      if @user.save
          UserMailer.with(user: @user).welcome_email.deliver_now
          redirect_to root_path
      end
  
  
  end
  
  private
  
  def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
  
  def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end