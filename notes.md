# Models
## User
 - has_many :stories
 - has_many :characters
 - has_many :stories, through: :characters
 - :username (string)
 - :email (string)
 - :password (string)

## Story
 - belongs_to :user
 - has_many :characters
 - has_many :users, through: :characters
 - :name (string)
 - :summary (text)
 - :story_outline (text)
 - :non_playable_persons

## Characters
 - belongs_to :user
 - belongs_to :story
 - :name (string)
 - :species (string)
 - :role (string)
 - :level (integer)
 - :description (string)