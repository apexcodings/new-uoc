require "rails_helper"
require "support/attributes"
require "support/authentication"

RSpec.describe "Deleting an Expert" do
  let(:admin) { User.create!(user_attributes) }
  let(:expert) { Expert.create!(expert_attributes(last_name: "Wayne")) }

  it "removes the Expert" do
    physician = expert

    sign_in(admin)

    visit experts_path

    expect {
      click_link "Remove"
    }.to change(Expert, :count)

    expect(current_path).to eq(experts_path)
    expect(page).not_to have_text(physician.last_name)
  end
end
