class Character < ApplicationRecord
  belongs_to :user
  belongs_to :story

  validates :name, :species, :role, :level, :description, :passcode, presence: true

  scope :alpha, -> { order (:name) }
end
