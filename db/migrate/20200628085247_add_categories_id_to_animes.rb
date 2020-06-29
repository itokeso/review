class AddCategoriesIdToAnimes < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :category_id, :integer
  end
end
