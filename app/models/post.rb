class Post < ApplicationRecord
  belongs_to :user
  belongs_to :anime
  validates :title, presence: true
  validates :review, presence: true
  # validates :rate, presence: true
end
