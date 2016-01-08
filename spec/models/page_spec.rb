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

  it "may have sub-pages" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page = page1.children.create!(page_attributes(title: "Child"))

    expect(page1.children).to include(sub_page)
    expect(sub_page.parent).to eq(page1)
  end

  it "knows its side navigation" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page1 = page1.children.create!(page_attributes(title: "Child 1"))
    sub_page2 = page1.children.create!(page_attributes(title: "Child 2"))

    expect(sub_page1.side_nav).to include(sub_page2)
  end

  it "orders its side navigation by position" do
    page1 = Page.create!(page_attributes(title: "Parent"))
    sub_page2 = page1.children.create!(page_attributes(title: "Child 2", position: 2))
    sub_page1 = page1.children.create!(page_attributes(title: "Child 1", position: 1))
    sub_page3 = page1.children.create!(page_attributes(title: "Child 3", position: 3))

    expected_side_nav = [sub_page1, sub_page2, sub_page3]

    expect(page1.side_nav).to eq(expected_side_nav)
  end

  it "knows when it's the 'Experts' page" do
    our_experts = Page.create!(page_attributes(title: "Our Experts"))

    expect(our_experts.experts?).to eq(true)
  end

  it "knows when it's not the 'Experts' page" do
    about = Page.create!(page_attributes(title: "About Us"))

    expect(about.experts?).to eq(false)
  end

  it "knows when it's the Sports Medicine page (in Services)" do
    sports = Page.create!(page_attributes(title: "Sports Medicine", slug: "sports-medicine-services"))

    expect(sports.sports_medicine?).to eq(true)
  end

  it "knows when it's not the Sports Medicine page (in Services)" do
    about = Page.create!(page_attributes(title: "About Us"))

    expect(about.sports_medicine?).to eq(false)
  end
end
