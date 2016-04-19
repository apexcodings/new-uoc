require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe "Listing Job Applications" do
  let(:admin) { User.create!(user_attributes) }
  let(:job) { Job.create!(job_attributes) }
  let!(:job_application) { job.job_applications.create!(job_application_attributes) }

  it "allows admins to list the job applications" do
    sign_in(admin)

    click_link "Job Applications"

    expect(current_path).to eq(job_applications_path)
    expect(page).to have_text(job.name)
    expect(page).to have_text(job_application.last_name)
  end

  it "prevents non signed-in users to access the job application listings" do
    visit job_applications_url

    expect(current_path).to eq(new_session_path)
    expect(page).to have_text("Please, sign in first!")
    expect(page).not_to have_text(job_application.last_name)
  end
end
