class AddRoomKindsToRooms < ActiveRecord::Migration[7.2]
  def change
    add_reference :rooms, :room_kinds, null: false, foreign_key: true
  end
end
