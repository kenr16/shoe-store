require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new store', {:type => :feature}) do
  it('allows a user to add a new store to the database') do
    visit('/')
    click_link('View Shoestores')
    fill_in('shoestore_name', :with =>'Test Shoestore')
    click_button('Add Shoestore')
    expect(page).to have_content('Test Shoestore')
  end
end

describe('viewing all of the shoestores', {:type => :feature}) do
  it('allows a user to see all of the shoestores that have been created') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    shoestore2 = Store.find_or_create_by({:name => 'Test Shoestore2'})
    visit('/shoestores')
    expect(page).to have_content('Test Shoestore1')
    expect(page).to have_content('Test Shoestore2')
  end
end

describe('modifying a shoestore', {:type => :feature}) do
  it('allows a user to rename a specific shoestore') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    visit("/shoestores/#{shoestore1.id}")
    fill_in("shoestore_name", {:with => "Renamed Test Shoestore"})
    click_button("Rename")
    visit("/shoestores")
    expect(page).to have_content('Renamed Test Shoestore')
  end
end

describe('deleting a shoestore', {:type => :feature}) do
  it('allows a user to remove a specific shoestore from the database') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    visit("/shoestores/#{shoestore1.id}")
    click_button("Delete")
    expect(page).to have_no_content('Test Shoestore1')
  end
end

describe('adding brands to a shoestore', {:type => :feature}) do
  it('allows a user to add brands to a shoestore') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    brand1 = Brand.find_or_create_by({:name => 'Test Brand', :cost => 100})
    Relationship.find_or_create_by({:brand_id => brand1.id, :store_id => shoestore1.id})
    visit("/shoestores/#{shoestore1.id}")
    expect(page).to have_content("Test Brand")
  end
end

describe('seeing details for a single shoestore', {:type => :feature}) do
  it('allows a user to click a shoestore and see details for it') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    brand1 = Brand.find_or_create_by({:name => 'Test Brand', :cost => 100})
    Relationship.find_or_create_by({:brand_id => brand1.id, :store_id => shoestore1.id})
    visit("/shoestores/#{shoestore1.id}")
    expect(page).to have_content("Test Brand")
    visit('/')
  end
end

describe('creating relationships with multiple shoe stores', {:type => :feature}) do
  it('allows a user to associate the same brand of shoes with multiple stores') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    shoestore2 = Store.find_or_create_by({:name => 'Test Shoestore2'})
    brand1 = Brand.find_or_create_by({:name => 'Test Brand', :cost => 100})
    Relationship.find_or_create_by({:brand_id => brand1.id, :store_id => shoestore1.id})
    Relationship.find_or_create_by({:brand_id => brand1.id, :store_id => shoestore2.id})
    visit("/shoestores/#{shoestore1.id}")
    expect(page).to have_content("Test Brand")
    visit("/shoestores/#{shoestore2.id}")
    expect(page).to have_content("Test Brand")
    visit('/')
  end
end

describe('creating multiple relationships with a shoe store', {:type => :feature}) do
  it('allows a user to associate multipls brands with the same shoestore') do
    shoestore1 = Store.find_or_create_by({:name => 'Test Shoestore1'})
    brand1 = Brand.find_or_create_by({:name => 'Test Brand 1', :cost => 100})
    brand2 = Brand.find_or_create_by({:name => 'Test Brand 2', :cost => 100})
    Relationship.find_or_create_by({:brand_id => brand1.id, :store_id => shoestore1.id})
    Relationship.find_or_create_by({:brand_id => brand2.id, :store_id => shoestore1.id})
    visit("/shoestores/#{shoestore1.id}")
    expect(page).to have_content("Test Brand 1")
    expect(page).to have_content("Test Brand 2")
    visit('/')
  end
end
