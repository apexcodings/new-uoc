require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing Appointments" do
  it "shows a list of all the appointment requests" do
    appointment1 = Appointment.create!(appointment_attributes(requestor_first_name: "John"))
    appointment2 = Appointment.create!(appointment_attributes(requestor_last_name: "Mary"))

    visit appointments_url

    expect(page).to have_text(appointment1.requestor_first_name)
    expect(page).to have_text(appointment2.requestor_first_name)
  end

  it "allows navigation to the appointment details" do
    appointment = Appointment.create!(appointment_attributes(requestor_first_name: "John"))

    visit appointments_url

    click_link("View Appointments Details")

    expect(current_path).to eq(appointment_path(appointment))

    expect(page).to have_text(appointment.created_at)
    expect(page).to have_text(appointment.requestor_first_name)
    expect(page).to have_text(appointment.requestor_first_name)
  end
end
