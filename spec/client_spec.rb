require("spec_helper")

describe(Client) do

	describe("#client_name") do
		it("lets you enter a client") do
			test_client = Client.new({:client_name => "ian", :stylist_id => 1})
			expect(test_client.client_name()).to(eq("ian"))
		end
	end
	
	# describe(".all") do
	# 	it("is empty at first") do
	# 		expect(Client.all()).to(eq([]))
	# 	end
	# end

	
end