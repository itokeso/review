class Anime < ApplicationRecord
  has_many :posts
  validates :title, presence: true
  validates :genre, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
