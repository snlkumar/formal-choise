class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :buyer
      t.string :name
      t.string :address
      t.string :contact
      t.timestamps
    end
  end
end
