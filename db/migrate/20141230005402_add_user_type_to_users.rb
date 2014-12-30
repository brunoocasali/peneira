class AddUserTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string, limit: 7
    # athlete, scout, admin
  end
end
