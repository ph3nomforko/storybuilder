class Journal < ApplicationRecord
  belongs_to :story
  belongs_to :user

  validates :content, :story_id, presence: true
end
