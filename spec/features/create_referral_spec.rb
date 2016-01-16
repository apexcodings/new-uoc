require 'rails_helper'
require 'support/attributes'
require 'support/pages'

RSpec.describe "Creating a Referral" do
  before do
    create_required_pages
    refer = Page.create!(title: "Refer a Patient")
  end

  it "shows the referral form" do
    visit page_url('refer-a-patient')

    expect(page).to have_field("Practice")
    expect(page).to have_field("Referring Physician")
    expect(page).to have_field("Your Name")
    expect(page).to have_field("Phone Number")
    expect(page).to have_field("Email Address")
    expect(page).to have_field("Fax Number (optional)")
    expect(page).to have_field("Patient Name")
    expect(page).to have_field("Date of Birth")
    expect(page).to have_field("Patient Phone Number")
    expect(page).to have_field("Patient Alternate Phone Number (optional)")
    expect(page).to have_field("Patient Email Address")
    expect(page).to have_field("Employer")
    expect(page).to have_field("Patient Insurance")
    expect(page).to have_field("Symptoms & Diagnosis")
  end

  it "saves the referral when valid" do
    thanks_page = Page.create!(page_attributes(title: "Thank You"))
    visit page_url('refer-a-patient')

    fill_in "Practice", with: "Save a lot"
    fill_in "Email Address", with: "email@example.com"

    fill_in "Patient Name", with: "Billy Willy"
    fill_in "Date of Birth", with: "1/15/16"
    fill_in "Patient Insurance", with: "Highmark"

    expect {
      click_button "Submit"
    }.to change(Referral, :count)

    referral = Referral.last

    expect(referral.practice).to eq("Save a lot")
    expect(referral.email).to eq("email@example.com")
    expect(referral.patient_name).to eq("Billy Willy")
    expect(referral.dob).to eq("1/15/16")
    expect(referral.insurance).to eq("Highmark")
  end
end
