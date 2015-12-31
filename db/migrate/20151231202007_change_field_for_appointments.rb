class ChangeFieldForAppointments < ActiveRecord::Migration
  def up
    rename_column :appointments, :insurance, :no_insurance
  end

  def down
    rename_column :appointments, :no_insurance, :insurance
  end
end
