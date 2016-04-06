require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting a Job" do
  let(:admin) { User.create!(user_attributes) }
  let!(:job) { Job.create!(job_attributes(name: "Job available for nurse")) }

  it "removes the job" do
    sign_in(admin)
    visit jobs_path
    expect {
      click_link "Remove"
    }.to change(Job, :count)

    expect(current_path).to eq(jobs_path)
    expect(page).not_to have_text(job.name)
  end
end
