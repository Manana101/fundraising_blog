class Post < ApplicationRecord
  extend ::Enumerize
  self.inheritance_column = nil

  enumerize :type, in: { full_width_image: 0, half_width_image: 1, no_image: 2 }

  belongs_to :category
  validates :title, :description, :type, :category_id, presence: true

  mount_uploader :image, ImageUploader

end
