require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe "Showing a job application" do
  let(:admin) { User.create!(user_attributes) }
  let(:job) { Job.create!(job_attributes) }
  let!(:job_application) { job.job_applications.create!(job_application_attributes) }

  it "shows the application details" do
    sign_in(admin)
    visit job_applications_url
    click_link "appl-details-#{job_application.id}"

    expect(page).to have_text(job.name)
    expect(page).to have_text(job.description)
    expect(page).to have_text(job_application.first_name)
    expect(page).to have_text(job_application.last_name)
    expect(page).to have_text(job_application.phone)
    expect(page).to have_text(job_application.email)
  end

  it "prevents non signed-in users to access the job application" do
    visit job_application_url(job_application)

    expect(current_path).to eq(new_session_path)
    expect(page).to have_text("Please, sign in first!")
    expect(page).not_to have_text(job_application.last_name)
  end

end
