require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Processing a referral" do
  let(:admin) { User.create!(user_attributes) }
  let!(:referral) { Referral.create!(referral_attributes) }

  before do
    sign_in(admin)
  end

  it "saves the referral from the index page and hides it from the referrals list" do
    visit referrals_path
    expect(page).to have_text(referral.email)

    expect {
      click_link "Save"
    }.not_to change(Referral, :count)

    expect(current_path).to eq(referrals_path)
    expect(page).not_to have_text(referral.email)
  end

  it "adds the referral to a processed referrals list" do
    visit processed_referrals_path
    expect(page).not_to have_text(referral.email)

    visit referrals_path
    expect(page).to have_text(referral.email)

    click_link "Save"

    visit processed_referrals_path
    expect(page).to have_text(referral.email)
  end

  it "saves the referral from the referral show page" do
    visit referral_path(referral)

    click_link "Save this referral"

    expect(Referral.processed).to include(referral)
  end
end
