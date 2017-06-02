class AddColumnsToTenant < ActiveRecord::Migration
  def change
    add_column :tenants, :late, :boolean
    add_column :tenants, :password, :string
  end
end
