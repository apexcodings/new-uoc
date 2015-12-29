require 'rails_helper'
require 'support/attributes'

RSpec.describe "Showing an expert" do
  before do
    @expert = Expert.create!(expert_attributes(category: "physicians"))
  end

  it "shows the expert details" do
    visit experts_url
    click_link(@expert.name)

    expect(current_path).to eq(expert_path(@expert))

    expect(page).to have_text(@expert.name)
    expect(page).to have_text(@expert.phone)
    expect(page).to have_text(@expert.location)
    expect(page).to have_text(@expert.specialty)
    expect(page).to have_text(@expert.procedures)
    expect(page).to have_text(@expert.education)
    expect(page).to have_text(@expert.body)
  end

  it "shows the category the expert is in" do
    visit expert_url(@expert)
    within(".experts-content h1") do
      expect(page).to have_text("Physicians")
    end
  end
end
