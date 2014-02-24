class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :product
      t.boolean :status
      t.timestamps
    end
  end
end
