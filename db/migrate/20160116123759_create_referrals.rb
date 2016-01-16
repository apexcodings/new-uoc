class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|
      t.string :practice
      t.string :physician
      t.string :name
      t.string :phone
      t.string :email
      t.string :fax
      t.string :patient_name
      t.string :dob
      t.string :patient_phone
      t.string :patient_phone_alt
      t.string :patient_email
      t.string :employer
      t.string :insurance
      t.text :diagnosis
      t.boolean :prior_surgery
      t.boolean :workers_comp
      t.boolean :bone_scan
      t.string :bone_scan_where
      t.boolean :ct_scan
      t.string :ct_scan_where
      t.boolean :mri
      t.string :mri_where
      t.boolean :emg
      t.string :emg_where
      t.boolean :x_rays
      t.string :x_rays_where
      t.boolean :cast
      t.string :cast_where
      t.string :preferred_physician
      t.string :preferred_office
      t.string :time_to_be_seen

      t.timestamps null: false
    end
  end
end
