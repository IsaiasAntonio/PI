class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.text :description
      t.references :ticket_state, foreign_key: true
      t.datetime :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
