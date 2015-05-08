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


	
end