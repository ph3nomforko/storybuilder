class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        @story = Story.find_by(id: params[:id])
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @stories = @user.stories
        else
            flash[:message] = "That user has not been created yet." if params[:user_id]
            @stories = Story.all
        end
    end
    
    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to story_path(@story)
        else
            render :new
        end
    end

    private

        def story_params
            params.require(:story).permit(:name, :summary, :story_outline)
        end

end
