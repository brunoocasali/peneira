class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.boolean :share_email
      t.boolean :share_phone

      t.timestamps null: false
    end
  end
end
