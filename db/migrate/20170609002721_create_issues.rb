class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :tenant, index: true, foreign_key: true
      t.references :unit, index: true, foreign_key: true
      t.string :category
      t.text :description
      t.integer :urgency

      t.timestamps null: false
    end
  end
end
