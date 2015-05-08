require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a new stylist", {:type => :feature}) do
	it("allows the user to click a stylist to see the clients") do
		visit("/")
		click_link("Add New Stylist")
		fill_in("stylist_name", :with => "cutter")
		click_button("Add Stylist")
		expect(page).to have_content("Success!")
	end
	
end