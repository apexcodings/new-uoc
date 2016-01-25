require "rails_helper"
require "support/attributes"

RSpec.describe "Editing a Page" do
  before do
    @page1 = Page.create!(page_attributes(title: "Athletic Trainers"))
    @user = User.create!(user_attributes)
  end

  it "doesn't show an Edit link if not logged in" do
    visit page_path(@page1)
    expect(page).not_to have_link("Edit")
  end

  it "shows an Edit link if logged in" do
    sign_in(@user)
    visit page_path(@page1)
    expect(page).to have_link("Edit")
  end

  it "saves the edited page" do
    sign_in(@user)
    visit page_path(@page1)

    click_link("Edit")

    # change the title

  end
end
