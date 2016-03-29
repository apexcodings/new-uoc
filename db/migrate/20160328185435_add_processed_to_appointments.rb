class AddProcessedToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :processed, :boolean, default: false
  end
end
