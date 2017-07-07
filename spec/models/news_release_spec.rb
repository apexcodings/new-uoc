require 'rails_helper'
require 'support/attributes'

RSpec.describe NewsRelease do

  it "is valid with default attributes" do
    news = NewsRelease.new(news_attributes)
    expect(news.valid?).to eq(true)
  end

  it "requires a title" do
    news = NewsRelease.new(title: "")
    news.valid?
    expect(news.errors[:title].any?).to eq(true)
  end

  it 'defaults to published when created' do
    news = NewsRelease.new
    expect(news.published?).to eq(true)
  end
end
