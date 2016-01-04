require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing the News" do
  before do
    @news1 = NewsRelease.create!(news_attributes(title: "News 1", created_at: 2.days.ago))
    @news2 = NewsRelease.create!(news_attributes(title: "News 2", created_at: 1.month.ago))
    @news3 = NewsRelease.create!(news_attributes(title: "News 3", created_at: 1.day.ago))
  end

  it "shows all the news" do
    visit root_url

    within(".site-navigation") do
      click_link "News"
    end

    expect(current_path).to eq(news_releases_path)

    expect(page).to have_text(@news1.title)
    expect(page).to have_text(@news2.title)
    expect(page).to have_text(@news3.title)
  end
end
