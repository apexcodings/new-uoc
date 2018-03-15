class AddYoutubeIdToNewsReleases < ActiveRecord::Migration
  def change
    add_column :news_releases, :youtube_id, :string
  end
end
