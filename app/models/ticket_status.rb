class TicketStatus < ActiveRecord::Base
	def self.getStatus status_id
		@status = TicketStatus.find(status_id).status
	end
end
