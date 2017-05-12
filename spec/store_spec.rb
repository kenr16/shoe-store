require("spec_helper")

describe(Store) do
  it { should have_many(:relationships) }

  it { should have_many(:brands) }
end

describe("Store") do

  describe(".create") do
    it("will check that the required capitalization of words is in place.") do
      new_store = Store.find_or_create_by({:name => 'test store'})
      expect(new_store.name).to(eq("Test Store"))
    end
  end

  describe(".create") do
    it("will check that the required non-capitalization of words is in place.") do
      new_store = Store.find_or_create_by({:name => 'test of store'})
      expect(new_store.name).to(eq("Test of Store"))
    end
  end

  describe(".create") do
    it("will check that the required word filters are in place.") do
      new_store = Store.find_or_create_by({:name => 'test of store clodhopper'})
      expect(new_store.name).to(eq("Test of Store"))
    end
  end

end
