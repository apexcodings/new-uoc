require 'rails_helper'
require 'support/attributes'

RSpec.describe "Listing Experts" do
  it "shows a list of experts by category" do
    physician1 = Expert.create!(expert_attributes(name: "Edwin J. Rogusky MD", category: "physicians"))
    physician2 = Expert.create!(expert_attributes(name: "Douglas E.R. Roeshot MD", category: "physicians"))
    therapist = Expert.create!(expert_attributes(name: "Joe Brescia MS, OTR/L, CHT", category: "physical_therapists"))
    trainer = Expert.create!(expert_attributes(name: "Samantha Debias MS, LAT, ATC", category: "athletic_trainers"))

    #visit "http://example.com/experts/physicians"
    visit experts_url(category: :physicians)

    expect(page).to have_link(physician1.name)
    expect(page).to have_link(physician2.name)
    expect(page).not_to have_link(therapist.name)
    expect(page).not_to have_link(trainer.name)
  end
end
