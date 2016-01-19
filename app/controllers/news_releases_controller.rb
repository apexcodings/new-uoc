class NewsReleasesController < ApplicationController
  def index
    @news = NewsRelease.order(created_at: :desc)
  end

  def show
    @news_release = NewsRelease.find(params[:id])
  end
end
