class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :property, index: true, foreign_key: true
      t.string :name
      t.integer :rent
      t.boolean :occupied
      t.date :lease_end
      t.integer :bedrooms
      t.integer :bathrooms
      t.string :washer_dryer
      t.string :parking
      t.integer :floor
      t.string :utilities
      t.boolean :furnished
      t.integer :sq_feet
      t.references :landlord, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
