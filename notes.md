# Models
## User
 - has_many :stories
 - has_many :characters
 - has_many :stories, through: :characters
 - :username (string)
 - :email (string)
 - :password_digest (string)

## Story
 - belongs_to :user
 - has_many :characters
 - has_many :users, through: :characters
 - :name (string)
 - :summary (text)
 - :story_outline (text)

## Characters
 - belongs_to :user
 - belongs_to :story
 - :name (string)
 - :species (string)
 - :role (string)
 - :level (integer)
 - :description (string)

# Stretch Goals
 - Create journal model to add to stories

# Nested Routes
 - '/users/:id/characters'
 - '/users/:id/stories'
 - '/stories/:id/characters'