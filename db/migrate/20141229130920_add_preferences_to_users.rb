class AddPreferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :preference, index: true
    add_foreign_key :users, :preferences
    add_foreign_key :users, :addresses
  end
end
