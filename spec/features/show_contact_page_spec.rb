require 'rails_helper'
require 'support/attributes'

RSpec.describe "Showing the contact page" do
  it "shows the contact form" do
    contact_page = Page.create!(page_attributes(title: "Contact Us"))

    visit root_url
    within(".site-navigation") do
      click_link "Contact Us"
    end

    expect(current_path).to eq(page_path(contact_page))

    expect(page).to have_field "First Name"
    expect(page).to have_field "Last Name"
    expect(page).to have_field "Email Address"
    expect(page).to have_field "Phone Number"
    expect(page).to have_field "Message"
  end
end
