class User < ApplicationRecord
    has_many :stories
    has_many :characters
    has_many :storyies, through: :characters
end
