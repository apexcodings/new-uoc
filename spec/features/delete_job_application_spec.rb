require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting a job application" do
  let(:admin) { User.create!(user_attributes) }
  let(:job) { Job.create!(job_attributes) }
  let!(:job_application) { job.job_applications.create!(job_application_attributes) }

  it "removes the job application" do
    sign_in(admin)
    visit job_applications_url

    expect {
      click_link "appl-#{job_application.id}"
    }.to change(JobApplication, :count)

    expect(current_path).to eq(job_applications_path)
    expect(page).not_to have_text(job_application.last_name)
  end
end
