require 'rails_helper'
require 'support/attributes'

RSpec.describe Expert do
  it "is valid with default attributes" do
    expert = Expert.new(expert_attributes)
    expect(expert.valid?).to eq(true)
  end

  it "requires a name" do
    expert = Expert.new(name: "")
    expert.valid?
    expect(expert.errors[:name].any?).to eq(true)
  end

  it "requires a phone" do
    expert = Expert.new(phone: "")
    expert.valid?
    expect(expert.errors[:phone].any?).to eq(true)
  end

  it "requires a location" do
    expert = Expert.new(location: "")
    expert.valid?
    expect(expert.errors[:location].any?).to eq(true)
  end

  it "requires a specialty" do
    expert = Expert.new(specialty: "")
    expert.valid?
    expect(expert.errors[:specialty].any?).to eq(true)
  end

  it "requires a procedures field" do
    expert = Expert.new(procedures: "")
    expert.valid?
    expect(expert.errors[:procedures].any?).to eq(true)
  end

  it "requires an education" do
    expert = Expert.new(education: "")
    expert.valid?
    expect(expert.errors[:education].any?).to eq(true)
  end

  it "requires a category" do
    expert = Expert.new(category: "")
    expert.valid?
    expect(expert.errors[:category].any?).to eq(true)
  end

  it "is valid when the category name is in the approved list" do
    categories = ["Physicians", "Physicians Assistants", "Physical Therapists", "Clinical Researchers", "Worker's Comp Rep", "Athletic Trainers", "Management"]

    categories.each do |category|
      expert = Expert.new(category: category.parameterize.underscore)
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
