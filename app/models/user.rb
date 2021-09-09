class User < ApplicationRecord
    has_many :stories
    has_many :characters
    has_many :played_stories, through: :characters, source: :story
    has_many :journals
    has_many :journaled_stories, through: :journals, source: :story

    has_secure_password

    validates :username, :email, presence: true
    validates :username, :email, uniqueness: true


end