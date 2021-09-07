class User < ApplicationRecord
    has_many :stories
    has_many :characters
    has_many :played_stories, through: :characters, source: :story

    has_secure_password
end
