require 'rails_helper'
require 'support/attributes'

describe Page do
  it "is valid with page_attributes" do
    page = Page.new(page_attributes)
    expect(page.valid?).to eq(true)
  end

  it "requires a title" do
    page = Page.new(title: "")
    page.valid?
    expect(page.errors[:title].any?).to eq(true)
  end

  it "requires a unique title" do
    page1 = Page.create!(page_attributes)

    page2 = Page.new(title: page1.title)
    page2.valid? 
    expect(page2.errors[:title].first).to eq("has already been taken")
  end

  it "generates a slug when it's created" do
    page = Page.create!(title: "Welcome to UOC")
    expect(page.slug).to eq("welcome-to-uoc")
  end

  it "requires a unique slug" do
    page1 = Page.create!(title: "Welcome to UOC")
    page2 = Page.new(slug: page1.slug)
    page2.valid?
    expect(page2.errors[:slug].first).to eq("has already been taken")
  end
end
