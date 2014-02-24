class CreateSeasions < ActiveRecord::Migration
  def change
    create_table :seasions do |t|
      t.string :name
      t.boolean :status
      t.timestamps
    end
  end
end
