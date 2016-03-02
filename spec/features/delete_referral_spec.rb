require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting a Referral" do
  let(:admin) { User.create!(user_attributes) }
  let!(:referral) { Referral.create!(referral_attributes) }

  it "removes the referral" do
    sign_in(admin)

    visit referrals_path

    expect(page).to have_text(referral.practice)

    expect {
      click_link "Delete"
    }.to change(Referral, :count)

    expect(current_path).to eq(referrals_path)
    expect(page).not_to have_text(referral.practice)
  end
end
