class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :tenant, index: true, foreign_key: true
      t.references :landlord, index: true, foreign_key: true
      t.string :name
      t.boolean :primary
      t.string :account_type
      t.string :card_type
      t.string :account_number
      t.date :expiration

      t.timestamps null: false
    end
  end
end
