class RemoveSpeciesColumnFromTreesTable < ActiveRecord::Migration
  def change
    remove_column :trees, :species
  end
end
