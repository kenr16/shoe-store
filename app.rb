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
  redirect('/')
end


get("/brands") do
  @brands = Brand.all
  erb(:brands)
end
