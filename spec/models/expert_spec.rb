require 'rails_helper'
require 'support/attributes'

RSpec.describe Expert do

  it "is valid with default attributes" do
    expert = Expert.new(expert_attributes)
    expect(expert.valid?).to eq(true)
  end

  it "returns experts that belong to some categories ordered by position" do
    bailey = Expert.create!(expert_attributes(last_name: "Bailey", position: 2, category: "clinical_researchers"))
    waine = Expert.create!(expert_attributes(last_name: "Waine", position: 0, category: "clinical_researchers"))
    cherry = Expert.create!(expert_attributes(last_name: "Cherry", position: 3, category: "clinical_researchers"))

    experts = [waine, bailey, cherry]
    expect(Expert.by_category("clinical_researchers")).to eq(experts)
  end

  it "returns experts that belong to other categories ordered by name" do
    bravo = Expert.create!(expert_attributes(last_name: "Bravo", category: "physicians"))
    alpha = Expert.create!(expert_attributes(last_name: "Alpha", category: "physicians"))
    charlie = Expert.create!(expert_attributes(last_name: "Charlie", category: "physicians"))

    experts = [alpha, bravo, charlie]
    expect(Expert.by_category("physicians")).to eq(experts)
  end

  it "requires a first name" do
    expert = Expert.new(first_name: "")
    expert.valid?
    expect(expert.errors[:first_name].any?).to eq(true)
  end

  it "requires a last name" do
    expert = Expert.new(last_name: "")
    expert.valid?
    expect(expert.errors[:last_name].any?).to eq(true)
  end

  it "requires a category" do
    expert = Expert.new(category: "")
    expert.valid?
    expect(expert.errors[:category].any?).to eq(true)
  end

  it "returns the expert full name" do
    expert = Expert.new(expert_attributes)
    expect(expert.name).to eq("#{expert.first_name} #{expert.last_name}")
  end


  it "is valid when the category name is in the approved list" do
    categories = { physicians: "Physicians", 
                 physicians_assistants: "Physicians Assistants", 
                 physical_therapists: "Physical Therapists", 
                 clinical_researchers: "Clinical Researchers", 
                 workers_comp: "Worker's Comp Rep", 
                 athletic_trainers: "Athletic Trainers" }

    categories.each_key do |key|
      expert = Expert.new(category: key)
      expert.valid?
      expect(expert.errors[:category].any?).to eq(false)
    end
  end

  it "is not valid when the category name is not in the approved list" do
    categories = ["Physician", "Physicians Assistants", "Therapist", "clinical", "janitor"]

    categories.each do |category|
      expert = Expert.new(category: category)
      expert.valid?
      expect(expert.errors[:category].any?).to eq(true)
    end
  end
end
