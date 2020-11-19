class RemoveWeatherColumnsFromTrees < ActiveRecord::Migration
  def change
    remove_column :trees, :weather
    remove_column :trees, :temperature
  end
end
