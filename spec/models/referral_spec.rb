require 'rails_helper'
require 'support/attributes'

RSpec.describe Referral do
  it "is valid with default attributes" do
    referral = Referral.new(referral_attributes)
    expect(referral.valid?).to eq(true)
  end

  it "requires an email" do
    referral = Referral.new(email: "")
    referral.valid?
    expect(referral.errors[:email].any?).to eq(true)
  end

  it "requires a patient name" do
    referral = Referral.new(patient_name: "")
    referral.valid?
    expect(referral.errors[:patient_name].any?).to eq(true)
  end

  it "requires a Date of birth" do
    referral = Referral.new(dob: "")
    referral.valid?
    expect(referral.errors[:dob].any?).to eq(true)
  end

  it "requires an Insurance" do
    referral = Referral.new(insurance: "")
    referral.valid?
    expect(referral.errors[:insurance].any?).to eq(true)
  end

end
