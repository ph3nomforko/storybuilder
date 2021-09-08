class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to stories_path
        else
            render :new
        end
    end

    private

        def story_params
            params.require(:story).permit(:name, :summary, :story_outline)
        end

end
