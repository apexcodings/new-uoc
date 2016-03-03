require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe "Listing Appointments" do
  it "allows only signed in users to list the appointments" do
    user = User.create!(user_attributes)
    appointment = Appointment.create!(appointment_attributes)

    visit appointments_url

    expect(current_path).to eq(new_session_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log In"

    expect(current_path).to eq(appointments_path)
    expect(page).to have_text(appointment.requestor_first_name)
  end

  it "prevents non signed in user to list the appointments" do
    appointment = Appointment.create!(appointment_attributes)

    visit appointments_url

    fill_in "Email", with: "wrong_email@example.com"
    fill_in "Password", with: "wrong_pass"

    click_button "Log In"

    expect(page).to have_text("Invalid")
  end

  it "shows a list of all the appointment requests" do
    user = User.create!(user_attributes)
    appointment1 = Appointment.create!(appointment_attributes(requestor_first_name: "John"))
    appointment2 = Appointment.create!(appointment_attributes(requestor_last_name: "Mary"))

    sign_in(user)

    visit appointments_url

    expect(page).to have_text(appointment1.requestor_first_name)
    expect(page).to have_text(appointment2.requestor_first_name)
  end

  it "allows navigation to the appointment details" do
    user = User.create!(user_attributes)
    appointment = Appointment.create!(appointment_attributes(requestor_first_name: "John"))

    sign_in(user)
    visit appointments_url

    click_link("View Details")

    expect(current_path).to eq(appointment_path(appointment))

    expect(page).to have_text(appointment.created_at)
    expect(page).to have_text(appointment.requestor_first_name)
    expect(page).to have_text(appointment.requestor_first_name)
  end

  it "allows download of all appointments as CSV file" do
    user = User.create!(user_attributes)
    appointment = Appointment.create!(appointment_attributes)

    sign_in(user)
    visit appointments_url

    expect(page).to have_link("Download All")
  end

  it "allows deleting all appointments" do
    user = User.create!(user_attributes)
    appt1 = Appointment.create!(appointment_attributes(requestor_first_name: "John"))
    appt2 = Appointment.create!(appointment_attributes(requestor_last_name: "Mary"))

    sign_in(user)
    visit appointments_url

    expect{
      click_link("delete-all")
    }.to change(Appointment, :count)

    expect(page).not_to have_text(appt1.requestor_first_name)
    expect(page).not_to have_text(appt2.requestor_first_name)
  end

end
