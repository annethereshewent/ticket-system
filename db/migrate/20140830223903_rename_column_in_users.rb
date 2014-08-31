class RenameColumnInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :usenamer, :username
  end
end
