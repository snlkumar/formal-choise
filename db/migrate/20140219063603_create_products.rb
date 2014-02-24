class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :seller
      t.references :category_id
      t.references :brand_id
      t.references :seasion_id
      t.string :name
      t.string :code
      t.string :description
      t.boolean :status
      t.references :color_id
      t.float :price
      t.timestamps
    end
  end
end
