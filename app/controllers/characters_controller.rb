class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:story_id] && @story = Story.find_by_id(params[:story_id])
            @characters = @story.characters
        else
            flash[:message] = "That story has not been created yet." if params[:story_id]
            @characters = Character.all
        end
    end

    def new
        @character = Character.new
    end

    def create
        @character = current_user.characters.build(character_params)
        if @character.save
            redirect_to characters_path
        else
            render :new
        end
    end

    private

        def character_params
            params.require(:character).permit(:name, :species, :role, :level, :description, :story_id)
        end
end
