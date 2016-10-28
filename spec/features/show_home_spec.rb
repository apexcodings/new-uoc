require 'rails_helper'

describe "Showing the Home page" do
  it "shows the main navigation" do
    visit root_url

    within(".site-navigation") do
      expect(page).to have_link("Specialties")
      expect(page).to have_link("Services")
      expect(page).to have_link("Our Experts")
      expect(page).to have_link("Patient Resources")
      expect(page).to have_link("Contact Us")
      expect(page).to have_link("Patient Log-In")
    end

    within(".top-links") do
      expect(page).to have_link("News")
    end
  end
end
