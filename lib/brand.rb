class Brand < ActiveRecord::Base
  has_many :relationships
  has_many :stores, through: :relationships
end
