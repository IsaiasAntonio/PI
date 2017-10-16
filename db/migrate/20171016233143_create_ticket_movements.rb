class CreateTicketMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :ticket_movements do |t|
      t.text :description
      t.references :movement_tag, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
