class Anime < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :category
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  mount_uploader :image, ImageUploader

  # ヘッダー検索
  def self.search(search)
    if search
      Anime.where('title LIKE(?)', "%#{search}%")
    end
  end
end
