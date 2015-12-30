require 'rails_helper'
require 'support/attributes'

RSpec.describe "Creating a contact" do
  it "saves the contact details to the database" do
    contact_page = Page.create!(page_attributes(title: "Contact Us"))
    thanks_page = Page.create!(page_attributes(title: "Thank You"))
    visit page_path(contact_page)

    fill_in "First Name", with: "Cesare"
    fill_in "Last Name", with: "Ferrari"
    fill_in "Email Address", with: "user@example.com"
    fill_in "Phone Number", with: "933 445-4466"
    fill_in "Message", with: "This is a test"

    expect {
      click_button "Submit"
    }.to change(Contact, :count)

    contact = Contact.last
    expect(contact.first_name).to eq("Cesare")
    expect(contact.last_name).to eq("Ferrari")
    expect(contact.email).to eq("user@example.com")
    expect(contact.phone).to eq("933 445-4466")
    expect(contact.message).to eq("This is a test")

    expect(current_path).to eq(page_path(thanks_page))
    expect(page).to have_text("Thank You")
  end
end
