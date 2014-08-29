class AddDefaultValueToStatus < ActiveRecord::Migration
  def change
  	change_column :tickets, :ticket_status, :integer, :default => 1;
  end
end
