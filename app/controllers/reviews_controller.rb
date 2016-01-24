class ReviewsController < ApplicationController
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

  private

  def review_params
    params.require(:review).permit(:first_name, :last_name, :phone, :email, :message)
  end
end
