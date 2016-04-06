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
end
