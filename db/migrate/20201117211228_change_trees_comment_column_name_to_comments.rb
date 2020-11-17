class ChangeTreesCommentColumnNameToComments < ActiveRecord::Migration
  def change
    rename_column :trees, :comment, :comments
  end
end
