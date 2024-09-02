class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.float :price
      t.boolean :status
      t.boolean :calicated
      t.references :User, null: false, foreign_key: true
      t.references :Room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
