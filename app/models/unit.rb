class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  has_many :tenants
end
