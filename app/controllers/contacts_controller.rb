class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      Emailer.contact_email(@contact).deliver_now
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error while submitting this form. Please, see below."
      @page = Page.find_by(slug: "contact-us")
      render template: "pages/show"
    end
  end

  private

  def contact_params
   # spam check parameter (:address)
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message, :address)
  end
end
