require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Listing Jobs" do
  let(:admin) { User.create!(user_attributes) }
  let!(:job) { Job.create!(job_attributes) }

  it "shows all the jobs available" do
    sign_in(admin)
    visit dashboard_path
    click_link "Job Listings"

    expect(current_path).to eq(jobs_path)
    expect(page).to have_text(job.name)
    expect(page).to have_text(job.description)
  end
end
