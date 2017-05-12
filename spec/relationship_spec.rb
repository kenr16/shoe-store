require("spec_helper")

describe(Relationship) do
  it { should belong_to(:brand) }

  it { should belong_to(:store) }
end

describe("Relationship") do

  describe(".create") do
    it("will check that the relationship has been created between stores and brands.") do
      new_store = Store.find_or_create_by({:name => 'test_store'})
      new_brand = Brand.find_or_create_by({:name => 'test_brand', :price => 150})
      new_thing = Relationship.find_or_create_by(store_id: new_store.id, brand_id: new_brand.id)
      expect(new_store.brands).to(eq([new_brand]))
    end
  end

end
