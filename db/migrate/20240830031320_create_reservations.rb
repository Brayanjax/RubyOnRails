class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.float :price
      t.integer :status
      t.boolean :calicated

      t.references :rooms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
