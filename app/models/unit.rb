class Unit < ActiveRecord::Base
  belongs_to :property
  belongs_to :landlord
  has_many :tenants, dependent: :destroy
  has_many :issues, dependent: :destroy
  has_one :lease

  mount_uploader :lease_img, LeaseImgUploader
end
