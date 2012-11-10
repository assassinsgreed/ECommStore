class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :quantity_on_hand
      t.float :price
      t.float :sale_price

      t.timestamps
    end
  end
end
