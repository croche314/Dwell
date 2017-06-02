class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :landlord, index: true, foreign_key: true
      t.string :type
      t.integer :num_units
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.boolean :pets
      t.string :outdoor_space
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
