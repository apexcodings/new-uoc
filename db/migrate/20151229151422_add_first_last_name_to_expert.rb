class AddFirstLastNameToExpert < ActiveRecord::Migration
  def up
    remove_column :experts, :name
    add_column :experts, :first_name, :string
    add_column :experts, :last_name, :string
    add_column :experts, :suffix, :string
  end

  def down
    remove_column :experts, :suffix
    remove_column :experts, :last_name
    remove_column :experts, :first_name
    add_column :experts, :name, :string
  end
end
