require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing the News" do
  it "shows all the news" do
    news1 = NewsRelease.create!(news_attributes(title: "News 1"))
    news2 = NewsRelease.create!(news_attributes(title: "News 2"))
    news3 = NewsRelease.create!(news_attributes(title: "News 3"))

    visit root_url

    within(".site-navigation") do
      click_link "News"
    end

    expect(current_path).to eq(news_releases_path)

    expect(page).to have_text(news1.title)
    expect(page).to have_text(news2.title)
    expect(page).to have_text(news3.title)
  end
end
