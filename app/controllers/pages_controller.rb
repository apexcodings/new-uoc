class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def home
  end

  def dashboard
  end

  def show
    @contact = Contact.new if @page.slug == "contact-us"
  end

  private

  def set_page
    @page = Page.find_by!(slug: params[:id])
  end

end
