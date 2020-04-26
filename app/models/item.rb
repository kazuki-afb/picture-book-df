class Item < ApplicationRecord
  validates :name, :ability_type_id, :ability_person, presence: true
  # 実の名前が重複しないようにする
  validates :name, uniqueness: true, if: -> {race.blank?}
  validates :race, uniqueness: true
  has_many :comments
  has_many :images
  belongs_to :ability_type
end
