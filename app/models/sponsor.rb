class Sponsor < ApplicationRecord

  validates :name, :image, :url, presence: true

  mount_uploader :image, ImageUploader
end
