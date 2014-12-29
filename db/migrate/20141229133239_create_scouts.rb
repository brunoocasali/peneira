class CreateScouts < ActiveRecord::Migration
  def change
    create_table :scouts do |t|
      t.references :user, index: true
      t.references :club, index: true

      t.timestamps null: false
    end
    add_foreign_key :scouts, :users
    add_foreign_key :scouts, :clubs
  end
end
