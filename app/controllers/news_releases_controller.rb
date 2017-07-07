class NewsReleasesController < ApplicationController
  before_action :require_signin, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]

  def index
    @news_releases = NewsRelease.published.order(created_at: :desc).paginate(page: params[:page])
  end

  def show
    if NewsRelease.find(params[:id]).published?
      @news_release = NewsRelease.find(params[:id])
    else
      if current_user_admin?
        @news_release = NewsRelease.find(params[:id])
      else
        redirect_to news_releases_url
      end
    end
  end

  def new
    @news_release = NewsRelease.new
  end

  def create
    @news_release = NewsRelease.new(news_release_params)
    if @news_release.save
      flash[:notice] = "News Release created correctly!"
      redirect_to @news_release
    else
      flash[:alert] = "There were some errors, see below"
      render :new
    end
  end

  def edit
    @news_release = NewsRelease.find(params[:id])
  end

  def update
    @news_release = NewsRelease.find(params[:id])
    if @news_release.update_attributes(news_release_params)
      redirect_to @news_release, notice: "News Release updated correctly!"
    else
      flash[:alert] = "There were some errors, see below"
      render :edit
    end
  end

  private

  def news_release_params
    params.require(:news_release).permit(:title, :body, :published)
  end
end
