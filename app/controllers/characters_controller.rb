class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in

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
