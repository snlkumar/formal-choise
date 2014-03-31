class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product
      t.references :cart
      t.integer :quantity,default: 1
      t.integer :order_id     
      t.timestamps     
      
    end
  end
end
