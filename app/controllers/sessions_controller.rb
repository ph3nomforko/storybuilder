class SessionsController < ApplicationController
    
    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def omniauth
        binding.pry
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["email"]
            user.email = auth["info"]["email"]
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to stories_path
        else
            redirect_to root_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    
end