class UserMailer < ApplicationMailer
    default from: 'usermailer@usermailer.com'
    def welcome_email
        @user = params[:user]
        puts "in the booooooooookingmaaaaaaaaaaaaaaaaaaaaaaailer"
        puts @user
        @url  = 'http://usermailer.com/login'
        mail(to: @user.email, subject: 'User Mailer')
    end
end
