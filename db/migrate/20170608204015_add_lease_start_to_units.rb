class AddLeaseStartToUnits < ActiveRecord::Migration
  def change
    add_column :units, :lease_start, :date
  end
end
