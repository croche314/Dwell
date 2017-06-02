class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.references :landlord, index: true, foreign_key: true
      t.references :property, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :birthdate
      t.string :phone
      t.string :email
      t.text :bio
      t.integer :income
      t.boolean :smoker

      t.timestamps null: false
    end
  end
end
