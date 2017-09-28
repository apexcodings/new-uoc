class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :description
      t.string :link_url
      t.string :link_title
      t.integer :position

      t.timestamps null: false
    end
  end
end
