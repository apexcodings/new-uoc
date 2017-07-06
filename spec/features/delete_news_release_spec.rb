require 'rails_helper'
require 'support/authentication'
require 'support/attributes'

RSpec.describe "Deleting a News Release" do
  let!(:release1) { NewsRelease.create!(news_attributes(title: "News to remove")) }
  let!(:release2) { NewsRelease.create!(news_attributes(title: "News not deleted")) }
  let(:admin) { User.create!(user_attributes) }

  before do
    sign_in(admin)
  end

  it 'removes the News release from the listing' do
    visit admin_news_releases_url

    within "#news-#{release1.id}" do
      expect {
      click_link("Remove")
      }.to change(NewsRelease, :count)
    end

    expect(current_path).to eq(admin_news_releases_path)
    expect(page).to have_text('News Release successfully removed!')
    expect(page).not_to have_text('News to remove')
    expect(page).to have_text('News not deleted')
  end

  it 'removes the News from the show page' do
    visit news_release_url(release1)

    expect {
    click_link("Remove")
    }.to change(NewsRelease, :count)

    expect(current_path).to eq(admin_news_releases_path)
    expect(page).to have_text('News Release successfully removed!')
    expect(page).not_to have_text('News to remove')
    expect(page).to have_text('News not deleted')
  end
end
