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
        set_story_by_params
        if current_user == @story.user || current_user.characters.find_by(id: @story.id)
            if params[:story_id] && set_story_by_params
                @journal = @story.journals.build
            else
                @journal = Journal.new
            end
        else
            redirect_to stories_path
        end
    end

    def create
        set_story_by_params
        @journal = current_user.journals.build(journal_params)
        if @journal.save && current_user == @story.user || current_user.characters.find_by(id: @story.id)
            redirect_to story_path(@journal.story_id)
        else
            render :new
        end
    end

    def edit
        find_and_set_journal
        set_story_by_params
        redirect_to story_path(@journal.story.id) if !@journal || !journal_authorized?
    end

    def update
        find_and_set_journal
        redirect_to stories_path if !@journal || !journal_authorized?
        if @journal.update(journal_params)
            redirect_to stories_path
        else
            render :edit
        end
    end

    def destroy
        find_and_set_journal
        set_story_by_params
        redirect_to stories_path if !@journal || !journal_authorized?
        @journal.destroy
        redirect_to user_path(current_user)
    end


    private

    def journal_params
        params.require(:journal).permit(:content, :story_id)
    end

    def find_and_set_journal
        @journal = Journal.find_by(id: params[:id])
    end

    def journal_authorized?
        find_and_set_journal
        @story = @journal.story
        current_user == @journal.user || current_user.journals.find_by(id: @story.id)
    end

end
