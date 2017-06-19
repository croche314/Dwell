class Landlord < ActiveRecord::Base
	has_many :properties
	has_many :units
	has_many :tenants
	has_many :leases
	has_many :accounts
end
