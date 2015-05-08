require("rspec")
require("pg")
require("client")
require("stylist")
require("pry")

DB = PG.connect({:dbname => "salon_test"}) #used for spec testing
# DB =PG.connect({:dbname => "to_do"})

RSpec.configure do |config|
	config.after(:each) do
		DB.exec("DELETE FROM stylists *;")
		DB.exec("DELETE FROM clients *;")
	end
end