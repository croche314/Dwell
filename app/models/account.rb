class Account < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :landlord
end
