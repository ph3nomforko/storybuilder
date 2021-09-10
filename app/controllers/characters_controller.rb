class CharactersController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        find_and_set_character
    end

    def index
        if params[:story_id] && set_story_by_params
            @characters = @story.characters
        elsif params[:user_id] && set_user_by_params
            @characters = @user.characters
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
        if @character.passcode == @story.passcode 
            if @character.save
                redirect_to user_characters_path(current_user.id)
            else
                render :new
            end
        else
            flash[:message] = "That passcode does not seem to match. Please check and try again."
            render :new
        end
    end

    def edit
        find_and_set_character
        redirect_if_not_authorized(@character)
    end

    def update
        find_and_set_character
        redirect_if_not_authorized(@character)
        if @character.update(character_params)
            redirect_to user_characters_path(current_user.id)
        else
            render :edit
        end
    end

    def destroy
        find_and_set_character
        redirect_if_not_authorized(@character)
        @character.destroy
        redirect_to user_path(current_user)
    end

    private

    def character_params
        params.require(:character).permit(:name, :species, :role, :level, :description, :story_id, :passcode)
    end

    def find_and_set_character
        @character = Character.find_by(id: params[:id])
    end

end
