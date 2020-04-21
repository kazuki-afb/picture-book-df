class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  mount_uploader :image, ImageUploader
end
