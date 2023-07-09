class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|

      t.timestamps
      t.text :explanation, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.string :phone_number, null: false
      t.time :open_time, null: false
      t.time :close_time, null: false
    end
  end
end
