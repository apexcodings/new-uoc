require "rails_helper"
require "support/attributes"
require "support/pages"

RSpec.describe "Creating a job application" do
  let!(:job) { Job.create!(job_attributes) }
  let!(:career_page) { Page.create!(title: "Careers", slug: "careers") }
  let!(:thank_you) { Page.create!(title: "Thank you", slug: "thank-you") }

  before do
    create_required_pages
    visit page_path("careers")
    click_link job.name
  end

  it "saves the details to the database when valid" do
    expect(current_path).to eq(new_job_application_path)

    fill_in "Last Name", with: "Pegasus"
    fill_in "job_application_phone", with: "555-666-7777"
    fill_in "Email", with: "applicant@example.com"
    attach_file "job_application_resume", "#{Rails.root}/db/data/sample_resume.pdf"

    expect {
      click_button "Submit"
    }.to change(JobApplication, :count)

    expect(JobApplication.last.last_name).to eq("Pegasus")
    expect(JobApplication.last.phone).to eq("555-666-7777")
    expect(JobApplication.last.email).to eq("applicant@example.com")
  end

  it "doesn't save the details when not valid" do
    fill_in "Last Name", with: ""

    expect {
      click_button "Submit"
    }.not_to change(JobApplication, :count)

    expect(page).to have_text("error")
    expect(page).to have_text(job.name)
    expect(page).to have_text(job.description)
  end

  it "shows the job it belongs to" do
    expect(page).to have_text(job.name)
    expect(page).to have_text(job.description)
  end
end
