require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require("pg")

DB = PG.connect({:dbname => "salon"})

get("/") do
	erb(:index)
end

get("/stylists") do
	@stylists = Stylists.all()
	erb(:stylists)
end

get("/stylists/new") do
	erb(:stylist_form)
end

post("/stylists") do
	stylist_name = params.fetch("stylist_name")
	stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
	stylist.save()
	erb(:stylist_success)
end

get("/stylists/:id") do
	@stylist = Stylist.find(params.fetch("id").to_i())
	erb(:add_client)
end

get("/clients/:id") do
	@stylist = params.fetch("id").to_i()
	erb(:add_client)
end

post("/clients/:id") do
	client_name = params.fetch("client_name")
	stylist_id = params.fetch("id").to_i()
	@stylist = Stylist.find(stylist_id)
	@client = Client.new({:client_name => client_name, :stylist_id => stylist_id})
	@client.save()
	erb(:client_success)
end