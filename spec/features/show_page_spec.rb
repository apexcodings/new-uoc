require 'rails_helper'
require 'support/attributes'

describe "Showing a page" do
  it "shows the page" do
    specialties = Page.create!(page_attributes(title: "Specialties"))

    visit root_url
    within(".site-navigation") do
      click_link "Specialties"
    end

    expect(current_path).to eq(page_path('specialties'))
    expect(page).to have_text(specialties.body)
  end
end
