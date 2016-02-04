require "rails_helper"
require "support/attributes"
require 'support/pages'
require 'support/authentication'

RSpec.describe "Editing an Expert" do
  before do
    create_required_pages
    @expert = Expert.create!(expert_attributes)
    @user = User.create!(user_attributes)
  end

  it "doesn't show an Edit link if not logged in" do
    visit expert_path(@expert)
    expect(page).not_to have_link("Edit")
  end

  it "shows an Edit link if logged in" do
    sign_in(@user)
    visit expert_path(@expert)
    expect(page).to have_link("Edit")
  end

  it "shows the current expert details" do
    sign_in(@user)
    visit expert_path(@expert)

    click_link("Edit")

    expect(current_path).to eq(edit_expert_path(@expert))

    expect(find_field("First Name").value).to eq(@expert.first_name)
    expect(find_field("Last Name").value).to eq(@expert.last_name)
    expect(find_field("Suffix").value).to eq(@expert.suffix)
    expect(find_field("Phone").value).to eq(@expert.phone)
    expect(find_field("Location").value).to eq(@expert.location)
    expect(find_field("Specialty").value).to eq(@expert.specialty)
    expect(find_field("Body").value).to eq(@expert.body)
    expect(find_field("Image Url").value).to eq(@expert.image_url)
    expect(find_field("Category").value).to eq(@expert.category)
  end

  it "updates the expert details and saves the updates" do
    sign_in(@user)
    visit edit_expert_path(@expert)

    fill_in "Suffix", with: "DO, MD, ASAP"

    click_button "Update Expert"

    expect(current_path).to eq(expert_path(@expert))
    expect(page).to have_text("DO, MD, ASAP")
  end

  it "doesn't update the expert if edit is not valid" do
    sign_in(@user)
    visit edit_expert_path(@expert)

    fill_in "Last Name", with: ""

    click_button "Update Expert"

    expect(page).to have_text('error')
  end
  
  it "allows uploading of an image" do
    sign_in(@user)
    visit edit_expert_path(@expert)

    attach_file "Photo", "#{Rails.root}/app/assets/images/DennisDevita.jpg"
    click_button "Update Expert"

    updated_expert = Expert.find(@expert)

    expect(current_path).to eq(expert_path(@expert))

    expect(updated_expert.photo.url).to eq("DennisDevita.jpg")

    #expect(page).to have_selector("img[src$='#{@page1.main_image.url}']")
    expect(page).to have_selector("img[src*='#{@expert.photo.url}']")
  end
end
