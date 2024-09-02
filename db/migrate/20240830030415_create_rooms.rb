class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.float :price
      t.boolean :status
      t.references :Calification, null: false, foreign_key: true
      t.references :Kinds, null: false, foreign_key: true
      t.references :Hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
