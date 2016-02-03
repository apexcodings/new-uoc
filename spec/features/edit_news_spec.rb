require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Editing News Releases" do
  let(:user) { User.create!(user_attributes) }
  let(:release) { NewsRelease.create!(news_attributes) }

  context "when user is logged in" do
    before do
      sign_in(user)
    end

    it "shows the edit form" do
      visit news_release_path(release)
      click_link "Edit"
      expect(current_path).to eq(edit_news_release_path(release))
      expect(find_field("Title").value).to eq(release.title)
      expect(find_field("Body").value).to eq(release.body)
    end

    it "saves the updated News Release when valid" do
      visit edit_news_release_path(release)
      fill_in "Title", with: "Updated title"
      click_button "Update News Release"

      expect(current_path).to eq(news_release_path(release))
      expect(page).to have_text("Updated title")
    end

    it "doesn't save the News Release when not valid" do
      visit edit_news_release_path(release)
      fill_in "Title", with: ""

      expect {
        click_button "Update News Release"
      }.not_to change(NewsRelease, :count)

      expect(page).to have_text("error")
    end
  end

  context "when user is not logged in" do
    it "doesn't show the Edit link" do
      visit news_release_path(release)
      expect(page).not_to have_link("Edit")
    end
  end
end
