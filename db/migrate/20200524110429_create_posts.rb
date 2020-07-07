class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.text   :review, null: false
      t.references :user, foreign_key: true
      t.references :anime, foreign_key: true
      t.float      :rate, null: false
      t.timestamps
    end
  end
end
