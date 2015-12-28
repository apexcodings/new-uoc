require 'rails_helper'
require 'support/attributes'

RSpec.describe "Showing an expert" do
  it "shows the expert details" do
    expert = Expert.create!(expert_attributes)

    visit experts_url
    click_link(expert.name)

    expect(current_path).to eq(expert_path(expert))

    expect(page).to have_text(expert.name)
    expect(page).to have_text(expert.phone)
    expect(page).to have_text(expert.location)
    expect(page).to have_text(expert.specialty)
    expect(page).to have_text(expert.procedures)
    expect(page).to have_text(expert.education)
    expect(page).to have_text(expert.body)
  end
end
