require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting an Appointment" do
  let(:admin) { User.create!(user_attributes) }
  let!(:appointment) { Appointment.create!(appointment_attributes) }

  it "removes the appointment" do
    sign_in(admin)

    visit appointments_path

    expect(page).to have_text(appointment.requestor_email)

    expect {
      click_link "Delete"
    }.to change(Appointment, :count)

    expect(current_path).to eq(appointments_path)
    expect(page).not_to have_text(appointment.requestor_email)
  end
end
