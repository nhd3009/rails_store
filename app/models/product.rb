class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validate :validate_images

  private

  def validate_images
    return unless images.attached?

    images.each do |image|
      unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
        errors.add(:images, "must be JPEG, PNG or JPG")
      end

      if image.blob.byte_size > 5.megabytes
        errors.add(:images, "size must be less than 5MB")
      end
    end

    if images.count > 5
      errors.add(:images, "can't be more than 5")
    end
  end
end
