require 'rails_helper'
require 'support/attributes'

describe "Logging in" do
  it "prompts for an email and password" do
    visit root_url
    click_link "Log In"

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field "Email"
    expect(page).to have_field "Password"
  end

  it "logs in a user with valid email/password" do
    user = User.create!(user_attributes)

    visit root_url

    click_link "Log In"

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Log In"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_text("Welcome back, #{user.name}!")
    expect(page).not_to have_link("Log In")
    expect(page).to have_link('Log Out')
  end

  it "does not log in a user with invalid email/password" do
    user = User.create!(user_attributes)

    visit root_url

    click_link "Log In"

    fill_in "Email", with: user.email
    fill_in "Password", with: "no match"

    click_button "Log In"

    expect(page).to have_text("Invalid")
    expect(page).not_to have_link(user.name)
    expect(page).to have_link("Log In")
    expect(page).not_to have_link('Log Out')
  end
end
