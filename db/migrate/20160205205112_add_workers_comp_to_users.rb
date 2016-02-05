class AddWorkersCompToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :workers_comp, :boolean, default: false
  end
end
