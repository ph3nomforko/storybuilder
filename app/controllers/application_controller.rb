class ApplicationController < ActionController::Base

    helper_method [:current_user, :logged_in?]

    private

        def current_user
            @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_not_logged_in
            redirect_to root_path if !logged_in?
        end

        def authorized_to_edit?(object)
            object.user == current_user
        end

        def redirect_if_not_authorized(object)
            redirect_to user_path(current_user) if !object || !authorized_to_edit?(object)
        end

        def set_story_by_params
            @story = Story.find_by_id(params[:story_id])
        end

        def set_user_by_params
            @user = User.find_by_id(params[:user_id])
        end
end