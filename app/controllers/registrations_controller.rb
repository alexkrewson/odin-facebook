class RegistrationsController < Devise::RegistrationsController

    # def edit
    # @user.avatar.attach(params[:avatar])
    # end

    private

    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def account_update_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :avatar)
    end

end