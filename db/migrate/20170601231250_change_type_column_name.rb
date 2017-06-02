class ChangeTypeColumnName < ActiveRecord::Migration
  def change
  	rename_column :properties,:type,:building_type
  end
end
