class NewsReleasesController < ApplicationController
  before_action :require_signin, except: [:index, :show]

  def index
    @news = NewsRelease.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    @news_release = NewsRelease.find(params[:id])
  end

  def new
    @news_release = NewsRelease.new
  end

  def create
    @news_release = NewsRelease.new(news_release_params)
    if @news_release.save
      flash[:notice] = "News Release saved correctly!"
      redirect_to @news_release
    else
      flash[:alert] = "There were some errors, see below"
      render :new
    end
  end

  private

  def news_release_params
    params.require(:news_release).permit(:title, :body)
  end
end
