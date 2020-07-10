class Category < ApplicationRecord
  has_many :animes
  validates :name, presence: true
  validates_uniqueness_of :name
end
