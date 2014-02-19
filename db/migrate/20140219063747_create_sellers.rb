class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :address
      t.string   :state
      t.string   :status,default: "Inactive"
      t.string   :city
      t.string   :mobile
      t.string   :buisness_name
      t.string   :buisness_address
      t.string   :buisness_state
      t.string   :buisness_city
      t.string   :buisness_mobile
      t.timestamps
    end
  end
end
