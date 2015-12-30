class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to page_path("thank-you")
    else
      flash[:alert] = "There was an error with this form."
      @page = Page.find_by(slug: "contact-us")
      render template: "pages/show"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
