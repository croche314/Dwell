class Property < ActiveRecord::Base
  belongs_to :landlord
  has_many :units
  has_many :tenants
  has_many :issues, :through => :units

  mount_uploader :lease_img, LeaseImgUploader
end
