require("spec_helper")

describe(Client) do

	describe("#client_name") do
		it("lets you enter a client") do
			test_client = Client.new({:client_name => "ian", :stylist_id => 1})
			expect(test_client.client_name()).to(eq("ian"))
		end
	end

	describe("#stylist_id") do
		it("lets you read out the stylist ID") do
			test_client = Client.new({:client_name => "ian", :stylist_id => 1})
			expect(test_client.stylist_id()).to(eq(1))
		end
	end

	describe("#==") do
		it("is the same client if it has the same client_name") do
			client = Client.new({:client_name => "spiderman", :stylist_id => 1})
			client2 = Client.new({:client_name => "spiderman", :stylist_id => 1})
			expect(client).to(eq(client2))
		end
	end
	
	describe(".all") do
		it("is empty at first") do
			expect(Client.all()).to(eq([]))
		end
	end

	
end