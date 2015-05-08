require("sinatra")
require("sinatra/reloader")
require("./lib/client")
require("./lib/stylist")
also_reload("lib/**/*.rb")
require("pg")
#require("spec_helper")

DB = PG.connect({:dbname => "salon_test"})## set back to "salon"

get("/") do
	erb(:index)
end

get("/stylists") do
	@stylists = Stylist.all()
	erb(:stylists)
end

get("/stylists/new") do
	erb(:stylist_form)
end

post("/stylists") do
	stylist_name = params.fetch("stylist_name")
	stylist = Stylist.new(:stylist_name => stylist_name, :id => nil)
	stylist.save()
	erb(:stylist_success)
end

get("/stylists/:id") do
	@stylist = Stylist.find(params.fetch("id").to_i())
	erb(:stylist) 
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

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  stylist_name = params.fetch("stylist_name")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:stylist_name => stylist_name})
  erb(:stylist)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
