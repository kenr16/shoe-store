class Store < ActiveRecord::Base
  has_many :relationships
  has_many :brands, through: :relationships
end
