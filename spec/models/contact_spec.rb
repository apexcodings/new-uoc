require 'rails_helper'
require 'support/attributes'

RSpec.describe Contact do
  it "is valid with default attributes" do
    contact = Contact.new(contact_attributes)
    expect(contact.valid?).to eq(true)
  end

  it "requires a last name" do
    contact = Contact.new(last_name: "")
    contact.valid?
    expect(contact.errors[:last_name].any?).to eq(true)
  end

  it "requires an email" do
    contact = Contact.new(email: "")
    contact.valid?
    expect(contact.errors[:email].any?).to eq(true)
  end

  it "accepts properly formatted email addresses" do
    emails = %w[contact@example.com first.last@example.com]
    emails.each do |email|
      contact = Contact.new(email: email)
      contact.valid?
      expect(contact.errors[:email].any?).to eq(false)
    end
  end

  it "rejects improperly formatted email addresses" do
    emails = %w[@ contact@ @example.com]
    emails.each do |email|
      contact = Contact.new(email: email)
      contact.valid?
      expect(contact.errors[:email].any?).to eq(true)
    end
  end

  it "requires a message" do
    contact = Contact.new(message: "")
    contact.valid?
    expect(contact.errors[:message].any?).to eq(true)
  end
end
