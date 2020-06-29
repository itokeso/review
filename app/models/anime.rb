class Anime < ApplicationRecord
  has_many :posts
  belongs_to :category
  validates :title, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
