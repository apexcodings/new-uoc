class AddPositionToExpert < ActiveRecord::Migration
  def change
    add_column :experts, :position, :integer
  end
end
