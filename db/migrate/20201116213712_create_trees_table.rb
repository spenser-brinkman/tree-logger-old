class CreateTreesTable < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :species
      t.integer :height
      t.integer :dbh
      t.string :survey_date
      t.string :foliage
      t.string :weather
      t.integer :temperature
      t.text :comment
    end
  end
end
