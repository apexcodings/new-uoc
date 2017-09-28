class Admin::SlidesController < ApplicationController
  before_action :get_slide, only: [:edit, :update, :destroy]

  def index
    @slides = Slide.by_position
  end

  def new
    @slide = Slide.new
  end

  def create
    @slide = Slide.new(slide_params)

    if @slide.save
      flash[:notice] = "Slide successfully created!"
      redirect_to admin_slides_path
    else
      flash[:alert] = "There were some errors, see below"
      render :new
    end
  end

  def edit
  end

  def update
    if @slide.update_attributes(slide_params)
      flash[:notice] = "Slide successfully updated!"
      redirect_to admin_slides_path
    else
      flash[:alert] = "There were some errors, see below"
      render :edit
    end
  end

  def destroy
    @slide.destroy
    flash[:notice] = "Slide successfully deleted!"
    redirect_to admin_slides_path
  end

  private

  def slide_params
    params.require(:slide).permit(:title, :description, :position, :link_url, :link_title, :photo)
  end

  def get_slide
    @slide = Slide.find(params[:id])
  end
end
