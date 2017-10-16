class CreateDependences < ActiveRecord::Migration[5.1]
  def change
    create_table :dependences do |t|
      t.string :name
      t.references :campus_location, foreign_key: true

      t.timestamps
    end
  end
end
