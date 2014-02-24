class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :product
      t.boolean :status
      t.timestamps
    end
  end
end
