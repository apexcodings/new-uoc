class AddProcessedToReferral < ActiveRecord::Migration
  def change
    add_column :referrals, :processed, :boolean, default: false
  end
end
