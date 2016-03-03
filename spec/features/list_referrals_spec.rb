require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe "Listing Referrals" do
  before do
    @user = User.create!(user_attributes)
    @referral = Referral.create!(referral_attributes)
  end

  it "allows only logged in users to list the referrals" do
    visit referrals_url

    expect(current_path).to eq(new_session_path)

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log In"

    expect(current_path).to eq(referrals_path)
    expect(page).to have_text(@referral.name)
  end

  it "prevents non logged in user to list the referrals" do
    visit referrals_url

    fill_in "Email", with: "wrong_email@example.com"
    fill_in "Password", with: "wrong_pass"

    click_button "Log In"

    expect(page).to have_text("Invalid")
  end

  it "shows a list of all the referrals" do
    referral1 = Referral.create!(referral_attributes(name: "John"))
    referral2 = Referral.create!(referral_attributes(name: "Mary"))

    sign_in(@user)

    visit referrals_url

    expect(page).to have_text(referral1.name)
    expect(page).to have_text(referral2.name)
  end

  it "allows navigation to the referral details" do
    sign_in(@user)
    visit referrals_url

    click_link("View Details")

    expect(current_path).to eq(referral_path(@referral))

    expect(page).to have_text(@referral.created_at)
    expect(page).to have_text(@referral.practice)
    expect(page).to have_text(@referral.physician)
    expect(page).to have_text(@referral.name)
  end

  it "allows download of all referrals as CSV file" do

    sign_in(@user)
    visit referrals_url

    expect(page).to have_link("Download All")
  end

  it "allows deleting all referrals" do
    referral1 = Referral.create!(referral_attributes(name: "referral1@example.com"))
    referral2 = Referral.create!(referral_attributes(name: "referral2@example.com"))

    sign_in(@user)
    visit referrals_url

    expect{
      click_link("delete-all")
    }.to change(Referral, :count)

    expect(page).not_to have_text(referral1.name)
    expect(page).not_to have_text(referral2.name)
  end
end
