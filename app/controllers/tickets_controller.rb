class TicketsController < ApplicationController
	def create 
		render plain: params[:ticket].inspect
	end
	
	def new
	end

	def show
		@ticket = Ticket.find(params[:id])
	end

	def create 
		@ticket = Ticket.new(ticket_params)

		@ticket.save
		redirect_to @ticket
	end

	def index
		@tickets = Ticket.all
	end
	private
		def ticket_params
			params.require(:ticket).permit(:title, :application, :summary)
		end
end
