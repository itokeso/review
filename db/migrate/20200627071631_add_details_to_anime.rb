class AddDetailsToAnime < ActiveRecord::Migration[5.2]
  def change
    add_column :animes, :detail, :text
  end
end
