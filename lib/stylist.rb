class Stylist
	attr_reader(:stylist_name, :id)

	define_method(:initialize) do |attributes|
		@stylist_name = attributes.fetch(:stylist_name)
		@id = attributes.fetch(:id)
	end


end