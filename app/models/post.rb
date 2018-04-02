class Post < ApplicationRecord
  extend ::Enumerize
  self.inheritance_column = nil

  enumerize :type, in: { full_width_image: 0, half_width_image: 1, no_image: 2 }

  # belongs_to :category
  # validates :title, :description, :type, :category_id, presence: true
  validates :title, :description, :type, presence: true

  mount_uploader :image, ImageUploader

  def get_url
    if url && url.empty?
      self
    else
      url
    end
  end

  def get_button_text
    if button_text && button_text.empty?
      "Show more"
    else
      button_text
    end
  end
end
