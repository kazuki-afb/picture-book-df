class Comment < ApplicationRecord
  validates :consumer, uniqueness: true
  belongs_to :user
  belongs_to :item
end
