class NewsReleasesController < ApplicationController
  def index
    @news = NewsRelease.all
  end
end
