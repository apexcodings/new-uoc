class AddDefaultPositionToSlides < ActiveRecord::Migration
  def up
    change_column :slides, :position, :integer, default: 0
  end

  def down
    change_column :slides, :position, :integer
  end
end
