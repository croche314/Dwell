class Property < ActiveRecord::Base
  belongs_to :landlord
  has_many :units, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :issues, :through => :units

  mount_uploader :img, LeaseImgUploader
end
