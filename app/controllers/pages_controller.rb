class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def home
  end

  def dashboard
  end

  def show
  end

  private

  def set_page
    @page = Page.find_by!(slug: params[:id])
  end

end
