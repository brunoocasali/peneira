class CreateFoots < ActiveRecord::Migration
  def change
    create_table :foots do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
