class JournalsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:story_id] && @story = Story.find_by_id(params[:story_id])
            @journals = @story.journals
        else
            flash[:message] = "That story has not been created yet." if params[:story_id]
            redirect_to new_story_path
        end
    end

    def new
        if params[:story_id] && @story = Story.find_by_id(params[:story_id])
            @journal = @story.journals.build
        else
            @journal = Journal.new
        end
    end

    def create
        @journal = current_user.journals.build(journal_params)
        if @journal.save
            redirect_to story_path(@journal.story_id)
        else
            render :new
        end
    end

    private

        def journal_params
            params.require(:journal).permit(:content, :story_id)
        end
end
