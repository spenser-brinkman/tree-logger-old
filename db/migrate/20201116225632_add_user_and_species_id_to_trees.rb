class AddUserAndSpeciesIdToTrees < ActiveRecord::Migration
  def change
    add_column :trees, :user_id, :integer
    add_column :trees, :species_id, :integer
  end
end
