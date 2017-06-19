class AddRoutingNumberColumnToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :routing_number, :string
  end
end
