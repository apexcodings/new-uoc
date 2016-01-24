class NewsReleasesController < ApplicationController
  def index
    @news = NewsRelease.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @news_release = NewsRelease.find(params[:id])
  end
end
