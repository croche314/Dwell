class ChangePetsToString < ActiveRecord::Migration
  def change
  	change_column :properties, :pets, :string
  end
end
