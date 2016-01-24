class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def home
  end

  def dashboard
  end

  def show
    @contact = Contact.new if @page.slug == "contact-us"

    # temporary
    @contact = Contact.new if @page.slug == "submit-review"

    @appointment = Appointment.new if @page.slug == "appointments"
    @referral = Referral.new if @page.slug == "refer-a-patient"
    @news = NewsRelease.order(created_at: :desc) if @page.slug == "news"
  end

  def search
  end

  private

  def set_page
    @page = Page.find_by!(slug: params[:id])
  end

end
