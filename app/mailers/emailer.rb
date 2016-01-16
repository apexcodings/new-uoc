class Emailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    mail( from:     contact.email,
          to:       "cesare@maryandferrari.com",
          subject:  "Contact form submission from UOC website")
  end

  def appointment_email(appointment)
    @appointment = appointment
    mail( from:     appointment.requestor_email,
          to:       "cesare@maryandferrari.com",
          subject:  "New Appointment Request from UOC website")
  end

  def referral_email(referral)
    @referral = referral
    mail( from:     referral.email,
          to:       "cesare@maryandferrari.com",
          subject:  "New Referral from UOC website")
  end
end
