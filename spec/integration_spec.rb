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

describe('viewing all of the stylists', {:type => :feature}) do
	it('allows a user to see all of the stylists that have been created') do
		stylist = Stylist.new({:stylist_name => 'ecutter', :id => nil})
		stylist.save()
		visit('/')
		click_link('View All Stylists')
		expect(page).to have_content(stylist.stylist_name)
	end
end

describe('seeing details for a single stylist', {:type => :feature}) do
	it('allows a user to click a stylist to see the clients for it') do
		test_stylist = Stylist.new({:stylist_name => 'styler', :id => nil})
		test_stylist.save()
		test_client = Client.new({:client_name => "moptop", :stylist_id => test_stylist.id()})
		test_client.save()
		visit('/stylists')
		click_link(test_stylist.stylist_name())
		expect(page).to have_content(test_client.client_name())
	end
end

describe('adding clients to a stylist', {:type => :feature}) do
	it('allows a user to add a client to a stylist') do
		test_stylist = Stylist.new({:stylist_name => 'styler', :id => nil})
		test_stylist.save()
		visit("/clients/#{test_stylist.id()}")
		fill_in("client_name", {:with => "scruffy"})
		click_button("Submit")
		expect(page).to have_content("Success")
	end
end