class Emailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    mail( from:     contact.email,
          to:       "cesare@maryandferrari.com",
          subject:  "Contact form submission from UOC website")
  end

  # to do
  def appointment_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
