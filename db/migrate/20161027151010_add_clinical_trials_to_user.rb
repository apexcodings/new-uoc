class AddClinicalTrialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :clinical_trials, :boolean
  end
end
