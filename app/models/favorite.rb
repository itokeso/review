class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # validates_uniqueness_ofによって、post_idとuser_idの組が1組しかないようにバリデーション
  validates_uniqueness_of :post_id, scope: :user_id
end
