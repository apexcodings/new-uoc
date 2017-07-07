class Admin::NewsReleasesController < ApplicationController
  before_action :require_signin
  before_action :require_admin

  def index
    @news_releases = NewsRelease.order(created_at: :desc).
      paginate(page: params[:page], per_page: 30)
  end

  def destroy
    @news_release = NewsRelease.find(params[:id])
    @news_release.destroy
    redirect_to admin_news_releases_url, notice: 'News Release successfully removed!'
  end
end
