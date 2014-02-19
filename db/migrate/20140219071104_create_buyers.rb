class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.references :product
      t.string     :first_name
      t.string     :last_name
      t.string     :address
      t.string     :state
      t.string     :city
      t.string     :mobile
      t.timestamps
    end
  end
end
