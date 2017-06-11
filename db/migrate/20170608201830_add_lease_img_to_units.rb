class AddLeaseImgToUnits < ActiveRecord::Migration
  def change
    add_column :units, :lease_img, :string
  end
end
