require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

RSpec.describe "Listing the News" do
  before do
    @news1 = NewsRelease.create!(news_attributes(title: "News 1", created_at: 2.days.ago))
    @news2 = NewsRelease.create!(news_attributes(title: "News 2", created_at: 1.month.ago))
    @news3 = NewsRelease.create!(news_attributes(title: "News 3", created_at: 1.day.ago))
    @unpublished = NewsRelease.create!(news_attributes(title: "*****Unpublished News",
                                                       created_at: 2.days.ago,
                                                       published: false))
  end

  it "shows the published news" do
    visit root_url

    within(".top-links") do
      click_link "News"
    end

    expect(current_path).to eq(news_releases_path)

    expect(page).to have_text(@news1.title)
    expect(page).to have_text(@news2.title)
    expect(page).to have_text(@news3.title)
    expect(page).not_to have_text(@unpublished.title)
  end


  it "allows navigating to the individual news page" do
    visit news_releases_path

    within(".main-content") do
      click_link @news1.title
    end

    expect(current_path).to eq(news_release_path(@news1))

    expect(page).to have_text(@news1.created_at)
    expect(page).to have_text(@news1.title)
    expect(page).to have_text(@news1.body)
  end

  context 'when Admin is logged in' do
    let(:admin) {User.create!(user_attributes)}

    before do
      sign_in(admin)
    end

    it 'shows the admin links' do
      visit admin_news_releases_url

      within "#news-#{@news1.id}" do
        expect(page).to have_text(@news1.title)
        expect(page).to have_link "Show"
        expect(page).to have_link "Edit"
        expect(page).to have_link "Remove"
      end
    end

    it 'allows navigation to the edit page' do
      visit admin_news_releases_url

      within "#news-#{@news1.id}" do
        click_link "Edit"
      end

      expect(current_path).to eq(edit_news_release_path(@news1))
    end

    it 'allows navigation from the Dashboard to the news list' do
      within ".dashboard-list" do
        click_link "News"
      end

      expect(current_path).to eq(admin_news_releases_path)
    end

    it 'lists All the news (published and unpublished)' do
      visit admin_news_releases_url
      expect(page).to have_text(@news1.title)
      expect(page).to have_text(@news2.title)
      expect(page).to have_text(@news3.title)
      expect(page).to have_text(@unpublished.title)
    end

    it 'shows the published label' do
      visit admin_news_releases_url

      within("#news-#{@news1.id}") do
        expect(page).to have_text("Published")
      end

      within("#news-#{@news2.id}") do
        expect(page).to have_text("Published")
      end

      within("#news-#{@news3.id}") do
        expect(page).to have_text("Published")
      end

      within("#news-#{@unpublished.id}") do
        expect(page).to have_text("Unpublished")
      end
    end
  end
end
