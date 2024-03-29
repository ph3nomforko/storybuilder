class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def index
        redirect_if_not_logged_in
        redirect_to user_path(current_user)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id # Log in
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        set_user
        redirect_to root_path if !@user
    end

    def edit
        set_user
        redirect_to user_path(current_user) if @user.id != current_user.id
    end

    def update
        set_user
        redirect_to user_path(current_user) if @user.id != current_user.id
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

end
