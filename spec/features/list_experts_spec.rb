require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing Experts" do

  before do
    @physician1 = Expert.create!(expert_attributes(first_name: "Edwin", last_name: "Rogusky MD", category: "physicians"))

    @physician2 = Expert.create!(expert_attributes(first_name: "Douglas E.R.", last_name: "Roeshot MD", category: "physicians"))

    @therapist = Expert.create!(expert_attributes(first_name: "Joe", last_name: "Brescia MS, OTR/L, CHT", category: "physical_therapists"))

    @trainer = Expert.create!(expert_attributes(first_name: "Samantha", last_name: "Debias MS, LAT, ATC", category: "athletic_trainers"))
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

    within(".experts-content h1") do
      expect(page).to have_text("Physicians")
    end

    expect(page).to have_link(@physician1.name)
    expect(page).to have_link(@physician2.name)
    expect(page).not_to have_link(@therapist.name)
    expect(page).not_to have_link(@trainer.name)
  end

  it "shows a list of Physical Therapists when category is physical_therapists" do
    visit experts_url(category: :physical_therapists)

    within(".experts-content h1") do
      expect(page).to have_text("Physical Therapists")
    end

    expect(page).to have_link(@therapist.name)
    expect(page).not_to have_link(@physician1.name)
    expect(page).not_to have_link(@physician2.name)
    expect(page).not_to have_link(@trainer.name)
  end

  it "shows a list of Athletic Trainers when category is athletic_trainers" do
    visit experts_url(category: :athletic_trainers)

    within(".experts-content h1") do
      expect(page).to have_text("Athletic Trainers")
    end

    expect(page).to have_link(@trainer.name)
    expect(page).not_to have_link(@physician1.name)
    expect(page).not_to have_link(@physician2.name)
    expect(page).not_to have_link(@therapist.name)
  end


  it "shows all the Experts categories in the side navigation" do
    our_experts = Page.create!(page_attributes(title: "Our Experts"))

    visit experts_url(category: :physicians)

    category_names = ["Physicians", "Physicians Assistants", "Physical Therapists", "Clinical Researchers", "Worker's Compensation Representative", "Athletic Trainers", "Management"]

    within(".side-navigation ul") do
      category_names.each do |name|
        expect(page).to have_link name
      end
    end
  end



end
