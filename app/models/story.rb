class Story < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :users, through: :characters
  has_many :journals
  has_many :users, through: :journals

  scope :alpha, -> { order (:name) }
  scope :most_popular, -> { left_outer_joins(:characters).group(:id).order('count(characters.id) desc') }

  validates :name, :summary, :story_outline, :passcode, presence: true

end
