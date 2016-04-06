require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Editing a Job" do
  let(:admin) { User.create!(user_attributes) }
  let!(:job) { Job.create!(job_attributes(name: "Physician")) }

  before do
    sign_in(admin)
    visit jobs_path
    click_link "Edit"
  end

  it "updates the details when they are valid" do
    expect(find_field('Name').value).to eq(job.name)

    fill_in "Name", with: "Updated name"
    click_button "Update Job"

    expect(current_path).to eq(jobs_path)
    expect(page).to have_text("Updated name")
  end

  it "doesn't update the job if invalid" do
    fill_in "Name", with: ""

    expect {
      click_button "Update Job"
    }.not_to change(Job, :count)

    expect(page).to have_text("error")
  end
end
