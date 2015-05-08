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
			espect(Stylist.all()).to(eq([]))
		end
	end

	
	
end