class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        find_and_set_story
    end

    def index
        if params[:user_id] && set_user_by_params
            @stories = @user.stories.alpha
        else
            flash[:message] = "That user has not been created yet." if params[:user_id]
            @stories = Story.most_popular
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

    def edit
        find_and_set_story
        redirect_if_not_authorized(@story)
    end

    def update
        find_and_set_story
        redirect_if_not_authorized(@story)
        if @story.update(story_params)
            redirect_to story_path(@story)
        else
            render :edit
        end
    end

    def destroy
        find_and_set_story
        redirect_if_not_authorized(@story)
        @story.destroy
        redirect_to user_path(current_user)
    end

    private

    def story_params
        params.require(:story).permit(:name, :summary, :story_outline, :passcode)
    end

    def find_and_set_story
        @story = Story.find_by(id: params[:id])
    end 

end
