class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name
      t.string :phone
      t.string :location
      t.string :specialty
      t.string :procedures
      t.string :education
      t.string :category
      t.text :body
      t.string :image_url, default: "expert_default.png"

      t.timestamps null: false
    end
  end
end
