class CreateRoomKinds < ActiveRecord::Migration[7.2]
  def change
    create_table :room_kinds do |t|
      t.string :name
      t.integer :bed

      t.timestamps
    end
  end
end
