class RenameStatusToTicketStatus < ActiveRecord::Migration
  def change
  	change_table :tickets do |t|
  		t.rename :status, :ticket_status
  	end
  end
end
