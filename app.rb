require("bundler/setup")
Bundler.require(:default)
require('pry')


Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/shoestores") do
  @shoestores = Store.all
  erb(:shoestores)
end

get("/shoestores/:id") do
  @shoestore = Store.find(params['id'])
  @list_brands = Brand.all
  @store_brands = @shoestore.brands
  erb(:shoestore)
end

post("/shoestores") do
  shoestore_name = params['shoestore_name']
  Store.create({:name => shoestore_name})
  redirect back
end

patch("/shoestores/:id") do
  new_name = params['shoestore_name']
  shoestore = Store.find(params['id'])
  shoestore.update({:name => new_name})
  redirect("/shoestores/#{shoestore.id}")
end

delete("/shoestores/:id") do
  shoestore = Store.find(params['id'])
  shoestore.destroy
  redirect('/shoestores')
end

get("/brands") do
  @brands = Brand.all
  erb(:brands)
end

get("/brands/:id") do
  @brand = Brand.find(params['id'])
  erb(:brand)
end

post("/brands") do
  brand_name = params['brand_name']
  brand_price = params['brand_price']
  Brand.create({:name => brand_name, :price => brand_price})
  redirect back
end

patch("/brands/:id") do
  new_name = params['brand_name']
  new_price = params['brand_price']
  brand = Brand.find(params['id'])
  brand.update({:name => new_name, :price => new_price})
  redirect("/brands/#{brand.id}")
end

delete("/brands/:id") do
  brand = Brand.find(params['id'])
  brand.destroy
  redirect('/brands')
end

post("/shoestores/:id") do
  brand = Brand.find(params["brand_id"].to_i)
  store = Store.find(params["id"].to_i)
  Relationship.create({:brand_id => brand, :store_id => store.id})
  redirect back
end
