class CreateNewsReleases < ActiveRecord::Migration
  def change
    create_table :news_releases do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
