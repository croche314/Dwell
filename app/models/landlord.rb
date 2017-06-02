class Landlord < ActiveRecord::Base
	has_many :properties
	has_many :units
	has_many :tenants
end
