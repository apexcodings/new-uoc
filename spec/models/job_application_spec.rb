require "rails_helper"
require "support/attributes"

RSpec.describe JobApplication do
  it "is valid with default attributes" do
    job = Job.create!(job_attributes)
    application = job.job_applications.new(job_application_attributes)
    expect(application.valid?).to eq(true)
  end

  it "requires a last name" do
    application = JobApplication.new(last_name: "")
    application.valid?
    expect(application.errors[:last_name].any?).to eq(true)
  end

  it "requires a phone" do
    application = JobApplication.new(phone: "")
    application.valid?
    expect(application.errors[:phone].any?).to eq(true)
  end

  it "requires an email" do
    application = JobApplication.new(email: "")
    application.valid?
    expect(application.errors[:email].any?).to eq(true)
  end

  it "belongs to a job" do
    job = Job.new(job_attributes)
    job_application = JobApplication.new(last_name: "Wayne")
    job_application.job = job

    expect(job_application.job).to eq(job)
  end
end
