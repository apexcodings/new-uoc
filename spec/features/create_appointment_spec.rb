require "rails_helper"
require "support/attributes"

RSpec.describe "Creating an appointment" do
  it "shows the appointment form" do
    visit root_path

    within(".site-header") do
      click_link "Make an appointment"
    end

    expect(current_path).to eq(new_appointment_path)
    expect(page).to have_field("Requestor First Name")
    expect(page).to have_field("Requestor Last Name")
    expect(page).to have_field("Patient First Name")
    expect(page).to have_field("Patient Last Name")
  end

  it "saves the appointment when valid" do
    thanks_page = Page.create!(page_attributes(title: "Thank You"))
    visit new_appointment_path

    fill_in "Requestor First Name", with: "Janet"
    fill_in "Requestor Last Name", with: "Doe"
    fill_in "Email", with: "cesare@maryandferrari.com"
    fill_in "appointment_requestor_phone_prefix", with: "814"
    fill_in "appointment_requestor_phone", with: "814-4455"
    fill_in "Patient First Name", with: "Jim"
    fill_in "Patient Last Name", with: "Bob"
    fill_in "appointment_patient_phone_prefix", with: "814"
    fill_in "appointment_patient_phone", with: "814-4455"

    find(:css, "#appointment_no_insurance").set(true)

    expect {
      click_button "Submit"
    }.to change(Appointment, :count)

    appointment = Appointment.last

    expect(appointment.requestor_first_name).to eq("Janet")
    expect(appointment.requestor_last_name).to eq("Doe")
    expect(appointment.requestor_phone_prefix).to eq("814")
    expect(appointment.requestor_phone).to eq("814-4455")
    expect(appointment.patient_first_name).to eq("Jim")
    expect(appointment.patient_last_name).to eq("Bob")
    expect(appointment.patient_phone_prefix).to eq("814")
    expect(appointment.patient_phone).to eq("814-4455")
  end
end
