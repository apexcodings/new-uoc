class Admin::NewsReleasesController < ApplicationController
  def index
    @news_releases = NewsRelease.all
  end

  def destroy
    @news_release = NewsRelease.find(params[:id])
    @news_release.destroy
    redirect_to admin_news_releases_url, notice: 'News Release successfully removed!'
  end
end
