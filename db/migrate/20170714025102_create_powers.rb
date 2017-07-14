class CreatePowers < ActiveRecord::Migration
  def change
    create_table :powers do |t|
      t.string :ability
      t.references :alien, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
