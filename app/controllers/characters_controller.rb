class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        @character = Character.find_by(id: params[:id])
    end

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
        @story = Story.find_by(id: @character.story_id)
        binding.pry
        if @character.passcode == @story.passcode && @character.save
      #  if @character.save
            redirect_to user_characters_path(current_user.id)
        else
            render :new
        end
    end

    private

        def character_params
            params.require(:character).permit(:name, :species, :role, :level, :description, :story_id, :passcode)
        end
end
