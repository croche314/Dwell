class Tenant < ActiveRecord::Base
  belongs_to :landlord
  belongs_to :property
  belongs_to :unit

  mount_uploader :lease_img, LeaseImgUploader
end
