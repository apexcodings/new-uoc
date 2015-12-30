class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :requestor_first_name
      t.string :requestor_mi
      t.string :requestor_last_name
      t.string :requestor_phone_prefix
      t.string :requestor_phone
      t.string :requestor_email
      t.string :requestor_time_to_reach
      t.string :patient_first_name
      t.string :patient_mi
      t.string :patient_last_name
      t.string :patient_phone_prefix
      t.string :patient_phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :us_state
      t.string :zip
      t.string :dob
      t.string :gender
      t.string :injury_location
      t.string :injury_location_other
      t.string :injury_date
      t.boolean :prior_treatment
      t.boolean :x_ray
      t.boolean :insurance
      t.string :insurance_plan_name
      t.string :insurance_policy_number
      t.string :preferred_location
      t.boolean :preferred_day_mo
      t.boolean :preferred_day_tu
      t.boolean :preferred_day_we
      t.boolean :preferred_day_th
      t.boolean :preferred_day_fr
      t.boolean :preferred_time_am
      t.boolean :preferred_time_pm
      t.string :appointment_type
      t.text :questions

      t.timestamps null: false
    end
  end
end
