class CreateAliens < ActiveRecord::Migration
  def change
    create_table :aliens do |t|
      t.string :name
      t.integer :year
      t.integer :month
      t.string :origin

      t.timestamps null: false
    end
  end
end
