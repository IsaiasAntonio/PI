class CreateCampusLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :campus_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
