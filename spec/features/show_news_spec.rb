require 'rails_helper'
require 'support/attributes'

RSpec.describe "Showing a news release" do
  before do
    @news = NewsRelease.create!(news_attributes(title: "News 1", created_at: 2.days.ago))
  end

  it "shows the full body and title" do
    visit news_release_path(@news)

    expect(page).to have_text(@news.title)
    expect(page).to have_text(@news.created_at)
    expect(page).to have_text(@news.body)
  end

  it "allows navigation back to the listing" do
    visit news_release_path(@news)

    click_link("Back to News")

    expect(current_path).to eq(news_releases_path)
    expect(page).to have_link(@news.title)
  end

  it "shows the most recent news in the sidebar" do
    visit news_release_path(@news)

    within(".side-navigation") do
      expect(page).to have_link(@news.title)
    end
  end

end
