class Item < ApplicationRecord
  validates :name, :ability_type, :ability_person, presence: true
  
  has_many :comments
end
