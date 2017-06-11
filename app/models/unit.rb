class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  has_many :tenants
  has_many :issues
  has_one :lease

  mount_uploader :lease_img, LeaseImgUploader
end
