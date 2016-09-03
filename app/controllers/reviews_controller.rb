class ReviewsController < ApplicationController

  before_action :require_signin, except: [:create]
  before_action :require_admin, except: [:create]

  def index
    @reviews = Review.order(created_at: :desc)
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      Emailer.review_email(@review).deliver_now
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error while submitting this form. Please, see below."
      @page = Page.find_by(slug: "submit-review")
      render template: "pages/show"
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_url
  end

  private

  def review_params
    params.require(:review).permit(:first_name, :last_name, :phone, :email, :message)
  end
end
