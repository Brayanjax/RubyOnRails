class CreateCalifications < ActiveRecord::Migration[7.2]
  def change
    create_table :califications do |t|
      t.float :points
      t.text :advice

      t.timestamps
    end
  end
end
