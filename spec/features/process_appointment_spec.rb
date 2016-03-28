require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Processing an appointment" do
  let(:admin) { User.create!(user_attributes) }
  let!(:appointment) { Appointment.create!(appointment_attributes) }

  before do
    sign_in(admin)
  end

  it "tags the appointment as processed and hides it from the appointment list" do
    visit appointments_path
    expect(page).to have_text(appointment.requestor_email)

    expect {
      click_link "Process"
    }.not_to change(Appointment, :count)

    expect(current_path).to eq(appointments_path)
    expect(page).not_to have_text(appointment.requestor_email)
  end

  it "adds the appointment to a processed appointments list" do
    visit processed_appointments_path
    expect(page).not_to have_text(appointment.requestor_email)

    visit appointments_path
    expect(page).to have_text(appointment.requestor_email)

    click_link "Process"

    visit processed_appointments_path
    expect(page).to have_text(appointment.requestor_email)
  end
end
