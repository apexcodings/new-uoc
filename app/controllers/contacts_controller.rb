class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    @contact.save
    redirect_to page_path("thank-you")
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
