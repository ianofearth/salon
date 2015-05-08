class Client
	attr_reader(:client, :stylist_id)

	define_method(:initialize) do |attributes|
		@client = attributes.fetch(:client)
		@stylist_id = attributes.fetch(:stylist_id)
	end



	# define_singleton_method(:all) do
	# 	returned_clients = DB.exec("SELECT * FROM clients")
	# 	clients = []
	# 	returned_clients.each() do |client|
	# 		@client = client.fetch("client")
	# 		stylist_id = client.fetch("stylist_id").to_i()
	# 		clients.push(Client.new({:client => client, :stylist_id => stylist_id}))
	# 	end
	# end


end