require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Creating an Expert" do
  context "when User is not logged in" do
    it "redirects to login page" do
      visit new_expert_url

      expect(current_path).to eq(new_session_path)
      expect(page).to have_text("Please, sign in first!")
    end
  end

  context "when Admin is logged in" do
    let(:admin) { User.create!(user_attributes) }

    it "shows the create form" do
      sign_in(admin)
      visit dashboard_url

      click_link "Create New Expert"

      expect(current_path).to eq(new_expert_path)

      expect(page).to have_field("First Name")
      expect(page).to have_field("Last Name")
      expect(page).to have_field("Suffix")
      expect(page).to have_field("Phone")
      expect(page).to have_field("Location")
      expect(page).to have_field("Specialty")
      expect(page).to have_select("Category")
      expect(page).to have_field("Photo")
      expect(page).to have_field("Body")
      expect(page).to have_button("Create Expert")
    end

    it "creates a new Expert when valid" do
      sign_in(admin)
      visit new_expert_url

      fill_in "First Name", with: "Jack"
      fill_in "Last Name", with: "LaMotte"
      select "Physicians", from: "Category"
      fill_in "Body", with: "Test Expert creation"

      expect {
        click_button "Create Expert"
      }.to change(Expert, :count)

      expert = Expert.last

      expect(expert.first_name).to eq("Jack")
      expect(expert.last_name).to eq("LaMotte")
      expect(expert.category).to eq("physicians")
      expect(expert.body).to eq("Test Expert creation")
    end

    it "doesn't create an expert when invalid" do
      sign_in(admin)
      visit new_expert_url

      fill_in "Last Name", with: ""

      expect {
        click_button "Create Expert"
      }.not_to change(Expert, :count)

      expect(page).to have_text("error")
    end
  end
end
