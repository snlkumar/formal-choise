class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product
      t.boolean :status
      t.timestamps
    end
  end
end
