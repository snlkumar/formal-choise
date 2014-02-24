class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :code
      t.boolean :status
      t.timestamps
    end
  end
end
