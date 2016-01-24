require 'rails_helper'
require 'support/attributes'
require 'support/pages'

RSpec.describe "Creating a review" do
  before do
    create_required_pages
    @review_page = Page.create!(page_attributes(title: "Review Us", slug: "submit-review"))
    @thanks_page = Page.create!(page_attributes(title: "Thank You"))
  end

  it "saves the details when review is valid" do
    visit page_path(@review_page)

    fill_in "First Name", with: "Cesare"
    fill_in "Last Name", with: "Ferrari"
    fill_in "Email Address", with: "user@example.com"
    fill_in "Phone Number", with: "933 445-4466"
    fill_in "Share your story", with: "This is a test"

    expect {
      click_button "Submit"
    }.to change(Review, :count)

    review = Review.last
    expect(review.first_name).to eq("Cesare")
    expect(review.last_name).to eq("Ferrari")
    expect(review.email).to eq("user@example.com")
    expect(review.phone).to eq("933 445-4466")
    expect(review.message).to eq("This is a test")

    expect(current_path).to eq(page_path(@thanks_page))
    expect(page).to have_text("Thank You")
  end

  it "doesn't save the review when it's invalid" do
    visit page_path(@review_page)

    expect {
      click_button "Submit"
    }.not_to change(Review, :count)

    expect(page).to have_text("error")
  end
end
