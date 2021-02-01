class RegistrationsController < Devise::RegistrationsController

    # def edit
    # @user.avatar.attach(params[:avatar])
    # end

    def create

        puts "user creaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaated"
        @user = User.create(sign_up_params)
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