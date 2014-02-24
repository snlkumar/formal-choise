class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
