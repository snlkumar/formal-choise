class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.timestamps
    end
  end
end
