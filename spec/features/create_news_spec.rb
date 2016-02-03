require "rails_helper"
require "support/attributes"
require 'support/authentication'

RSpec.describe "Creating News Releases" do
  let(:user) {User.create!(user_attributes)}

  context "when logged in" do
    before do
      sign_in(user)
    end

    it "shows the new News Release page" do
      visit dashboard_url
      click_link "Create News Release"
      expect(current_path).to eq(new_news_release_path)
      expect(page).to have_field "Title"
      expect(page).to have_field "Body"
      expect(page).to have_button "Create News Release"
    end

    it "saves the News Release when it's valid" do
      visit new_news_release_url
      fill_in "Title", with: "Today the sky is blue"
      fill_in "Body", with: "lorem ipsum dolor sit amet"

      expect {
        click_button "Create News Release"
      }.to change(NewsRelease, :count)

      release = NewsRelease.last

      expect(release.title).to eq("Today the sky is blue")
      expect(release.body).to eq("lorem ipsum dolor sit amet")
    end

    it "doesn't save the News Release when it's not valid" do
      visit new_news_release_url
      fill_in "Title", with: ""

      expect {
        click_button "Create News Release"
      }.not_to change(NewsRelease, :count)

      expect(page).to have_text("error")
    end
  end

  context "when not logged in" do
    it "redirect the user to the home page" do
      visit new_news_release_url
      expect(current_path).to eq(new_session_path)
    end
  end
end
