class AddPublishedToNewsReleases < ActiveRecord::Migration
  def change
    add_column :news_releases, :published, :boolean, default: true
  end
end
