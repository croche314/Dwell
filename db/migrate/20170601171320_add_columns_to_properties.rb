class AddColumnsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :units_occupied, :integer
    add_column :properties, :monthly_income, :integer
    add_column :properties, :img, :string
  end
end
