class Item < ApplicationRecord
  validates :name, :ability_type_id, :ability_person, presence: true
  
  has_many :comments
  belongs_to :ability_type
end
