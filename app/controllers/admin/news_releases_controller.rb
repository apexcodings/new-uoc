class Admin::NewsReleasesController < ApplicationController
  def index
    @news_releases = NewsRelease.all
  end
end
