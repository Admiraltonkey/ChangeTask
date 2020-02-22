class News < ApplicationRecord
  mount_uploader :img, ImageUploader
  belongs_to :post
  belongs_to :user
end
