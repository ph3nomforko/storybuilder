class Story < ApplicationRecord
  belongs_to :user
  has_many :characters
  has_many :users, through: :characters
  has_many :journals
  has_many :users, through: :journals
end
