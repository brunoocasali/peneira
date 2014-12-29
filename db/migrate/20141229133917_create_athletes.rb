class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.references :user, index: true
      t.date :birthday
      t.float :height, precision: 3, scale: 2
      t.float :weight, precision: 3, scale: 2
      t.boolean :allow_to_travel
      t.references :foot, index: true
      t.references :position, index: true

      t.timestamps null: false
    end
    
    add_foreign_key :athletes, :users
    add_foreign_key :athletes, :foots
    add_foreign_key :athletes, :positions
  end
end
