require 'rails_helper'
require 'support/attributes'

RSpec.describe Review do
  it "is valid with default attributes" do
    review = Review.new(review_attributes)
    expect(review.valid?).to eq(true)
  end

  it "requires a last name" do
    review = Review.new(last_name: "")
    review.valid?
    expect(review.errors[:last_name].any?).to eq(true)
  end

  it "requires an email" do
    review = Review.new(email: "")
    review.valid?
    expect(review.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted email addresses" do
    emails = %w[review@example.com first.last@example.com]
    emails.each do |email|
      review = Review.new(email: email)
      review.valid?
      expect(review.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ review@ @example.com]
    emails.each do |email|
      review = Review.new(email: email)
      review.valid?
      expect(review.errors[:email].any?).to eq(true)
    end
  end

  it "requires a message" do
    review = Review.new(message: "")
    review.valid?
    expect(review.errors[:message].any?).to eq(true)
  end
end
