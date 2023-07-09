class CreateShopGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_genres do |t|

      t.timestamps
      t.integer :shop_id, null: false
      t.integer :genre_id, null: false
    end
  end
end
