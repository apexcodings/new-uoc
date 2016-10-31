require 'rails_helper'
require 'support/attributes'
require 'support/authentication'
require 'support/pages'

RSpec.describe 'Signing in a Clinical Trials User' do
  let(:user) { User.create!(user_attributes(clinical_trials: true)) }

  let!(:clinical_trials) { Page.create!(page_attributes(title: 'Clinical Trials', body: 'Clinic trials page'))}
  let!(:altoona) { clinical_trials.children.create!(page_attributes(title: 'Altoona'))}
  let!(:state_college) { clinical_trials.children.create!(page_attributes(title: 'State College'))}

  before do
    create_required_pages
    sign_in(user)
  end

  it 'shows a limited dashboard' do
    expect(page).to have_link('Clinical Trials')
    expect(page).to have_link('Altoona')
    expect(page).to have_link('State College')
  end

  it "shows editing links for authorized (clinical trials) pages" do
    within('#clinical-trials-edit') { expect(page).to have_link("Edit") }
    within('#altoona-edit') { expect(page).to have_link("Edit") }
    within('#state-college-edit') { expect(page).to have_link("Edit") }
  end

  it "doesn't show general links" do
    within('.admin-navigation') do
      expect(page).not_to have_link('Experts')
      expect(page).not_to have_link('News')
      expect(page).not_to have_link('Appointment Requests')
      expect(page).not_to have_link('Referrals')
    end

    within('.dashboard-list') do
      expect(page).not_to have_link('Experts')
      expect(page).not_to have_link('News')
      expect(page).not_to have_link('Appointment Requests')
      expect(page).not_to have_link('Referrals')
      expect(page).not_to have_link('Job Listings')
      expect(page).not_to have_link('Job Applications')
      expect(page).not_to have_link('Patient Reviews')
    end
  end

  it "doesn't show editing links within pages" do
    visit page_path('services')
    expect(page).not_to have_link("Edit")
  end
end
