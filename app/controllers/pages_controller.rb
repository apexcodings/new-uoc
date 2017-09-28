class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:home, :show]
  before_action :require_admin, except: [:home, :show,]

  def home
  end

  def dashboard
  end

  def clinical_trials_dashboard
  end

  def show
    @contact = Contact.new if @page.slug == "contact-us"
    @review = Review.new if @page.slug == "submit-review"
    @appointment = Appointment.new if @page.slug == "appointments"
    @referral = Referral.new if @page.slug == "referring-physicians"
    @news = NewsRelease.order(created_at: :desc) if @page.slug == "news"
    @jobs = Job.all if @page.slug == "careers"
    @reviews = Review.published if @page.slug == 'patient-reviews'
  end

  def edit
  end

  def update
    if @page.update_attributes(page_params)
      flash[:notice] = "Page successfully updated!"
      redirect_to @page
    else
      flash[:alert] = "There were some errors, see below"
      render :edit
    end
  end

  def search
  end

  private

  def set_page
    @page = Page.find_by!(slug: params[:id])
  end

  def page_params
    params.require(:page).permit(:title, :body, :position, :label, :image_url, :redirect_url, :slug, :seo_title, :seo_description, :seo_keywords, :main_image, :publish)
  end

end
