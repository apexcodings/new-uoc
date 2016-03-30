require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting an Appointment" do
  let(:admin) { User.create!(user_attributes) }
  let!(:appointment) { Appointment.create!(appointment_attributes) }
  let!(:appointment2) { Appointment.create!(appointment_attributes(requestor_email: "appt2@example.com")) }

  before do
    sign_in(admin)
  end

  it "removes the individual appointment" do
    visit appointments_path

    expect(page).to have_text(appointment.requestor_email)

    expect {
      #click_link "Delete"
      click_link "appt-#{appointment.id}"
    }.to change(Appointment, :count)

    expect(current_path).to eq(appointments_path)
    expect(page).not_to have_text(appointment.requestor_email)
  end

  it "removes not saved appointments in bulk" do
    visit appointments_path

    expect(page).to have_text(appointment.requestor_email)
    expect(page).to have_text(appointment2.requestor_email)

    within "#top-utility-links" do
      click_link "Delete All"
    end

    expect(Appointment.all).to be_empty
  end

  it "doesn't remove saved appointments" do
    visit appointments_path

    expect(page).to have_text(appointment.requestor_email)
    expect(page).to have_text(appointment2.requestor_email)

    click_link "save-appt-#{appointment2.id}"

    within "#top-utility-links" do
      click_link "Delete All"
    end

    expect(Appointment.all).to include(appointment2)
  end

  it "redirects to saved appointments when deleted appointment is a saved one" do
    visit appointments_path
    click_link "save-appt-#{appointment2.id}"

    visit processed_appointments_path

    click_link "delete-appt-#{appointment2.id}"

    expect(current_path).to eq(processed_appointments_path)
  end

end
