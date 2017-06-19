class Tenant < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :property
  belongs_to :unit
  has_many :accounts

  mount_uploader :lease_img, LeaseImgUploader
end
