require 'rails_helper'
require 'support/attributes'

RSpec.describe "Show portal pages" do
  it "shows all the portal pages in the sidebar" do
    what = Page.create!(page_attributes(title: "What is NextMD?"))
    why = Page.create!(page_attributes(title: "Why NextMD?"))
    how = Page.create!(page_attributes(title: "How NextMD Works"))
    appointments = Page.create!(page_attributes(title: "Appointments", slug: "portal-appointments"))
    messaging = Page.create!(page_attributes(title: "Messaging"))
    faq = Page.create!(page_attributes(title: "FAQ"))

    visit page_url(what)

    within(".side-navigation") do
      expect(page).to have_text "Patient Portal"
      expect(page).to have_link(what.title)
      expect(page).to have_link(why.title)
      expect(page).to have_link(how.title)
      expect(page).to have_link(appointments.title)
      expect(page).to have_link(messaging.title)
      expect(page).to have_link(faq.title)
    end
  end
end

