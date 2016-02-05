class Emailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    mail( from:     contact.email,
          #to:       "cesare@maryandferrari.com",
          to:       "info@uoc.com",
          subject:  "Contact form submission from UOC website")
  end

  def review_email(review)
    @review = review
    mail( from:     review.email,
          #to:       "cesare@maryandferrari.com",
          to:       "info@uoc.com",
          subject:  "Patient Review form submission from UOC website")
  end

  def appointment_email(appointment)
    @appointment = appointment

    if @appointment.appointment_type == "Workers Compensation"
      mail( from:     appointment.requestor_email,
            #to:       "cesareferrar@gmail.com",
            to:       "appts@uoc.com",
            subject:  "New Workers Comp Appointment Request from UOC website")
    else
      mail( from:     appointment.requestor_email,
            #to:       "cesare@maryandferrari.com",
            to:       "appts@uoc.com",
            subject:  "New Appointment Request from UOC website")
    end

  end

  def referral_email(referral)
    @referral = referral
    mail( from:     referral.email,
          #to:       "cesare@maryandferrari.com",
          to:       "appts@uoc.com",
          subject:  "New Referral from UOC website")
  end
end
