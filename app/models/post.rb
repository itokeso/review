class Post < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  validates :title, presence: true
  validates :review, presence: true
  validates :rate, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
