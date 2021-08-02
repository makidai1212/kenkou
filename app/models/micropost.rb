class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope -> {order( created_at: :desc)}

  def display_image
    image.variant(resize_to_limit: [500, 500])
  end

end
