class NewsReleasesController < ApplicationController
  def index
    @news = NewsRelease.order(created_at: :desc)
  end
end
