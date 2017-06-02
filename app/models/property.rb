class Property < ActiveRecord::Base
  belongs_to :landlord
  has_many :units
  has_many :tenants
end
