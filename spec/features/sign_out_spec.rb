require 'rails_helper'
require 'support/attributes'
require 'support/authentication'

describe "Logging out" do
  it "removes the user id from the session" do
    user = User.create!(user_attributes)

    sign_in(user)

    within(".admin-navigation") do
      click_link 'Log Out'
    end

    expect(page).to have_text("logged out")
    expect(page).not_to have_link('Log Out')
    expect(page).to have_link('Log In')
  end
end
