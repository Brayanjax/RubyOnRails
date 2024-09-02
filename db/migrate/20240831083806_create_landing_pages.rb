class CreateLandingPages < ActiveRecord::Migration[7.2]
  def change
    create_table :landing_pages do |t|
      t.timestamps
    end
  end
end
