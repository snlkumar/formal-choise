class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :seller
      t.references :category
      t.references :brand
      t.references :seasion
      t.string :name
      t.string :code
      t.string :description
      t.boolean :status
      t.references :color
      t.float :price
      t.timestamps
    end
  end
end
