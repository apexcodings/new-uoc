require "rails_helper"
require "support/attributes"
require 'support/pages'
require 'support/authentication'

RSpec.describe "Editing a Page" do
  before do
    create_required_pages
    @page1 = Page.create!(page_attributes(title: "Athletic Trainers", body: "Text in the page"))
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

  it "updates the page and shows the edited page" do
    sign_in(@user)
    visit page_path(@page1)

    click_link("Edit")

    expect(current_path).to eq(edit_page_path(@page1))
    expect(find_field("Title").value).to eq(@page1.title)
    expect(find_field("Body").value).to eq(@page1.body)

    fill_in "Title", with: "Services Page"
    fill_in "Body", with: "This is the new content"
    fill_in "SEO Title", with: "Page title for SEO"
    fill_in "SEO Keywords", with: "tag1, tag2, tag3"
    fill_in "SEO Description", with: "UOC central pennsylvania"

    click_button "Update Page"

    expect(current_path).to eq(page_path(@page1))

    expect(page).to have_text("Services Page")
    expect(page).to have_text("This is the new content")
    expect(page).to have_text('Page successfully updated!')
  end

  it "doesn't update the page if edit is not valid" do
    sign_in(@user)
    visit edit_page_path(@page1)

    fill_in "Title", with: ""

    click_button "Update Page"

    expect(page).to have_text('error')
  end

end
