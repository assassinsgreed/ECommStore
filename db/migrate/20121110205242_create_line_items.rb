class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity_ordered
      t.decimal :price_sold
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
