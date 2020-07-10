class RemoveGenreFromAnimes < ActiveRecord::Migration[5.2]
  def change
    remove_column :animes, :genre, :string
  end
end
