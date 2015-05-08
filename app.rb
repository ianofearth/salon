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