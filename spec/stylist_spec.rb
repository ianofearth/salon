require("spec_helper")

describe(Stylist) do

	describe("#stylist_name") do
		it("tells you a stylist name") do
			stylist = Stylist.new({:stylist_name => "cutter", :id => nil})
			expect(stylist.stylist_name()).to(eq("cutter"))
		end
	end

	describe(".all") do
		it("starts off with no stylists") do
			expect(Stylist.all()).to(eq([]))
		end
	end

	describe("#save") do
		it("lets you save a stylist to the database") do
			test_stylist = Stylist.new({:stylist_name => "cutter", :id => nil})
			test_stylist.save()
			expect(Stylist.all()).to(eq([test_stylist]))
		end
	end

	describe("#==") do
		it("is the same stylist if it has the same name") do
			stylist = Stylist.new({:stylist_name => "cutter", :id => nil})
			stylist2 = Stylist.new({:stylist_name => "cutter", :id => nil})
			expect(stylist).to(eq(stylist2))
		end
	end

	describe(".find") do
		it("returns a stylist by its ID") do
			test_stylist = Stylist.new({:stylist_name => "cutter", :id => nil})
			test_stylist.save()
			test_stylist2 = Stylist.new({:stylist_name => "styler", :id => nil})
			test_stylist2.save()
			expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
		end
	end

	describe("#clients") do
		it("returns an array of clients") do
			test_stylist = Stylist.new({:stylist_name => "cutter", :id => nil})
			test_stylist.save()
			test_client = Client.new({:client_name => "moptop", :stylist_id => test_stylist.id()})
			test_client.save()
			test_client2 = Client.new({:client_name => "scruffy", :stylist_id => test_stylist.id()})
			test_client2.save()
			expect(test_stylist.clients()).to(eq([test_client, test_client2]))
		end
	end

	describe("#update") do
		it("lets you update stylists in the database") do
			stylist = Stylist.new({:stylist_name => "cutsok", :id => nil})
			stylist.save()
			stylist.update({:stylist_name => "cutswell"})
			expect(stylist.stylist_name()).to(eq("cutswell"))
		end
	end

	describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:stylist_name => "cutsok", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:stylist_name => "cutswell", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

  describe("#delete") do
  	it("deletes a stylist's tasks from the database") do
      stylist = Stylist.new({:stylist_name => "cutsnotsogood", :id => nil})
      stylist.save()
      client = Client.new({:client_name => "badhaircut", :stylist_id => stylist.id()})
      client.save()
      client2 = Client.new({:client_name => "worsehaircut", :stylist_id => stylist.id()})
      client2.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end

	
end