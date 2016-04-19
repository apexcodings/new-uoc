require "rails_helper"
require "support/attributes"

RSpec.describe Job do
  it "is valid with default attributes" do
    job = Job.new(job_attributes)
    expect(job.valid?).to eq(true)
  end

  it "requires a name" do
    job = Job.new(name: "")
    job.valid?
    expect(job.errors[:name].any?).to eq(true)
  end

  it "may have many applications" do
    job = Job.new(name: "LPT")
    job_application1 = job.job_applications.new(last_name: "Wayne")
    job_application2 = job.job_applications.new(last_name: "Pierre")

    expect(job.job_applications).to include(job_application1)
    expect(job.job_applications).to include(job_application2)
  end
end
