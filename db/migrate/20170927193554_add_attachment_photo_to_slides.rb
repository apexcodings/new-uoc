class AddAttachmentPhotoToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :slides, :photo
  end
end
