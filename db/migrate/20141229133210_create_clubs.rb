class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name, limit: 100
      t.date :founded
      t.references :address, index: true

      t.timestamps null: false
    end
    add_foreign_key :clubs, :addresses
  end
end
