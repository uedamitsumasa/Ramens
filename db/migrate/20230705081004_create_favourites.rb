class CreateFavourites < ActiveRecord::Migration[6.1]
  def change
    create_table :favourites do |t|

      t.timestamps
      t.integer :shop_id, null: false
      t.integer :user_id, null: false
    end
  end
end
