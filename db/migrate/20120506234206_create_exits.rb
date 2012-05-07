class CreateExits < ActiveRecord::Migration
  def change
    create_table :exits do |t|
      t.integer :room_id
      t.integer :destination_id
      t.string :name

      t.timestamps
    end
  end
end
