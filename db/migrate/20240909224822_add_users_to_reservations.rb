class AddUsersToReservations < ActiveRecord::Migration[7.2]
  def change
    add_reference :reservations, :users, null: false, foreign_key: true
  end
end
