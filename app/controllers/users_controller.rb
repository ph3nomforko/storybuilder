class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # Log in
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        redirect_to root_path if !@user
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
