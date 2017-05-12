require("spec_helper")

describe(Brand) do
  it { should have_many(:relationships) }

  it { should have_many(:stores) }
end

describe("Brand") do

  describe(".create") do
    it("will check that the required capitalization of words is in place.") do
      new_brand = Brand.find_or_create_by({:name => 'test brand'})
      expect(new_brand.name).to(eq("Test Brand"))
    end
  end

  describe(".create") do
    it("will check that the required non-capitalization of words is in place.") do
      new_brand = Store.find_or_create_by({:name => 'test of brand'})
      expect(new_brand.name).to(eq("Test of Brand"))
    end
  end

  describe(".create") do
    it("will check that the required word filters are in place.") do
      new_brand = Store.find_or_create_by({:name => 'test of brand clodhopper'})
      expect(new_brand.name).to(eq("Test of Brand"))
    end
  end

end
