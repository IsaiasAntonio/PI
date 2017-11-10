class AddPropertyToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :responsable_id, :integer
  end
end
