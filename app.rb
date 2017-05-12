require("bundler/setup")
Bundler.require(:default)
require('pry')
require('bcrypt')

enable  :sessions, :logging

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get("/shoestores") do
  if session[:user_id] != nil
    @shoestores = Store.all
    erb(:shoestores)
  else
    erb(:security)
  end
end

get("/shoestores/:id") do
  @shoestore = Store.find(params['id'])
  @list_brands = Brand.all
  erb(:shoestore)
end

post("/shoestores") do
  shoestore_name = params['shoestore_name']
  Store.find_or_create_by({:name => shoestore_name})
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
  if session[:user_id] != nil
    @brands = Brand.all
    erb(:brands)
  else
    erb(:security)
  end
end



get("/brands/:id") do
  @brand = Brand.find(params['id'])
  @list_stores = Store.all
  erb(:brand)
end

post("/brands") do
  brand_name = params['brand_name']
  brand_price = params['brand_price']
  Brand.find_or_create_by({:name => brand_name, :cost => brand_price})
  redirect back
end

patch("/brands/:id") do
  new_name = params['brand_name']
  new_price = params['brand_price']
  brand = Brand.find(params['id'])
  brand.update({:name => new_name, :cost => new_price})
  redirect("/brands/#{brand.id}")
end

delete("/brands/:id") do
  brand = Brand.find(params['id'])
  brand.destroy
  redirect('/brands')
end

post("/shoestores/:id/relationship") do
  store_id = params['store_id']
  brand_id = params['brand_id']
  Relationship.find_or_create_by({:brand_id => brand_id, :store_id => store_id})
  redirect back
end

post("/brands/:id/relationship") do
  store_id = params['store_id']
  brand_id = params['brand_id']
  Relationship.find_or_create_by({:brand_id => brand_id, :store_id => store_id})
  redirect back
end

post "/signup" do
  user = User.new(:username => params[:username], :password => params[:password])
  if user.save
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb(:security)
  end
end

post "/login" do
  user = User.find_by(:username => params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    puts "Success!"
    redirect back
  else
    puts "Failure."
    erb(:security)
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect back
end

get "/security" do
  @user_id = session[:user_id]
  erb(:security)
end
