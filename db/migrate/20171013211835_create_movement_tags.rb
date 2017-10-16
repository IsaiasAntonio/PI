class CreateMovementTags < ActiveRecord::Migration[5.1]
  def change
    create_table :movement_tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
