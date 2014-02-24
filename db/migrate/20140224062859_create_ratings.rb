class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :product
      t.timestamps
    end
  end
end
