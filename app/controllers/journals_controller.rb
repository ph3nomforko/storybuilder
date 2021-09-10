class JournalsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:story_id] && set_story_by_params
            @journals = @story.journals
        else
            flash[:message] = "That story has not been created yet." if params[:story_id]
            redirect_to new_story_path
        end
    end

    def new
        if params[:story_id] && set_story_by_params
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

    def edit
        @journal = Journal.find_by(id: params[:id])
        redirect_to stories_path if !@journal || @journal.user != current_user
    end

    def update
        @journal = Journal.find_by(id: params[:id])
        redirect_to stories_path if !@journal || @journal.user != current_user
        if @journal.update(journal_params)
            redirect_to stories_path
        else
            render :edit
        end
    end

    private

        def journal_params
            params.require(:journal).permit(:content, :story_id)
        end
end
