class Client
	attr_reader(:client_name, :stylist_id)

	define_method(:initialize) do |attributes|
		@client_name = attributes.fetch(:client_name)
		@stylist_name = attributes.fetch(:stylist_id)
	end


end