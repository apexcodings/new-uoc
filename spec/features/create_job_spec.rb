require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Creating a Job" do
  let(:admin) { User.create!(user_attributes) }

  before do
    sign_in(admin)
    visit jobs_path
    click_link "Create New Job"
  end

  it "saves the job details when valid" do
    fill_in "Name", with: "Physician position"
    fill_in "Description", with: "This is the description for Physician position"

    expect {
      click_button "Create Job"
    }.to change(Job, :count)

    expect(current_path).to eq(jobs_path)
    expect(page).to have_text("Physician position")
    expect(page).to have_text("This is the description for Physician position")
  end

  it "doesn't save the job if invalid" do
    expect {
      click_button "Create Job"
    }.not_to change(Job, :count)

    expect(page).to have_text("error")
  end
end
