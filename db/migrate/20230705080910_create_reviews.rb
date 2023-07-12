class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.string :user_id, null: false
      t.string :shop_id, null: false
      t.integer :star, null: false, default: 0
      t.text :content
    end
  end
end