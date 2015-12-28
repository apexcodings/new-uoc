require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing Experts" do

  before do
    @physician1 = Expert.create!(expert_attributes(name: "Edwin J. Rogusky MD", category: "physicians"))

    @physician2 = Expert.create!(expert_attributes(name: "Douglas E.R. Roeshot MD", category: "physicians"))

    @therapist = Expert.create!(expert_attributes(name: "Joe Brescia MS, OTR/L, CHT", category: "physical_therapists"))

    @trainer = Expert.create!(expert_attributes(name: "Samantha Debias MS, LAT, ATC", category: "athletic_trainers"))
  end

  it "shows details for each expert" do
    visit experts_url(category: :physicians)

    expect(page).to have_link(@physician1.name)
    expect(page).to have_text(@physician1.phone)
    expect(page).to have_text(@physician1.location)
    expect(page).to have_text(@physician1.specialty)
    expect(page).to have_text(@physician1.procedures)
    expect(page).to have_text(@physician1.education)

    expect(page).to have_link(@physician2.name)
    expect(page).to have_text(@physician2.phone)
    expect(page).to have_text(@physician2.location)
    expect(page).to have_text(@physician2.specialty)
    expect(page).to have_text(@physician2.procedures)
    expect(page).to have_text(@physician2.education)
  end

  it "shows a list of Physicians when the category selected is physicians" do
    visit experts_url(category: :physicians)

    expect(page).to have_link(@physician1.name)
    expect(page).to have_link(@physician2.name)
    expect(page).not_to have_link(@therapist.name)
    expect(page).not_to have_link(@trainer.name)
  end

  it "shows a list of Physical Therapists when category is physical_therapists" do
    visit experts_url(category: :physical_therapists)

    expect(page).to have_link(@therapist.name)
    expect(page).not_to have_link(@physician1.name)
    expect(page).not_to have_link(@physician2.name)
    expect(page).not_to have_link(@trainer.name)
  end

  it "shows a list of Athletic Trainers when category is athletic_trainers" do
    visit experts_url(category: :athletic_trainers)

    expect(page).to have_link(@trainer.name)
    expect(page).not_to have_link(@physician1.name)
    expect(page).not_to have_link(@physician2.name)
    expect(page).not_to have_link(@therapist.name)
  end
end
