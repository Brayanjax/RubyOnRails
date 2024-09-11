class CreateRooms < ActiveRecord::Migration[7.2]


  def change
    create_table :rooms do |t|
      t.string :name
      t.float :price
      t.boolean :status
      t.references :califications, null: false, foreign_key: true

      t.references :hotels, null: false, foreign_key: true

      t.timestamps
    end
  end
end
