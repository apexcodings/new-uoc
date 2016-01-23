class AddPortalTokenToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :portal_token, :boolean
  end
end
