class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.text :react, null: false
    end
  end
end
