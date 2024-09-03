class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.references :roles, null: false, foreign_key: true

      t.timestamps
    end
  end
end
