require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe 'Signing in a Full Admin User' do
  let(:user) { User.create!(user_attributes) }

  before do
    sign_in(user)
  end

  it "doesn't show clinical trials links" do
    expect(page).not_to have_link('Clinical Trials')
    expect(page).not_to have_link('Altoona')
    expect(page).not_to have_link('State College')
  end

  it "shows the full dashboard" do
    expect(page).to have_link('Experts')
    expect(page).to have_link('News')
    expect(page).to have_link('Appointment Requests')
    expect(page).to have_link('Referrals')
    expect(page).to have_link('Job Listings')
    expect(page).to have_link('Job Applications')
    expect(page).to have_link('Patient Reviews')
  end
end

