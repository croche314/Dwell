class ChangeAccountToBigint < ActiveRecord::Migration
  def change
  	 remove_column :accounts, :account_number
  	 add_column :accounts, :acct_number, :bigint
  end
end
