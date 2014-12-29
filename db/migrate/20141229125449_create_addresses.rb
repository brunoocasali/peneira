class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city, limit: 200
      t.string :state, limit: 35 
      t.string :country, limit: 2

      t.timestamps null: false
    end
  end
end
