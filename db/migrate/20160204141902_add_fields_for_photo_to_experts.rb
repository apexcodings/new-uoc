class AddFieldsForPhotoToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :photo_file_name, :string
    add_column :experts, :photo_content_type, :string
    add_column :experts, :photo_file_size, :integer
    add_column :experts, :photo_updated_at, :datetime
  end
end
