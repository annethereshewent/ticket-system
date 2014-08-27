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

		if @ticket.save
			redirect_to @ticket
		else
			@errormsg = '<p style="color:red">An error has occurred</p>'
			render 'new'
		end
	end

	def index
		@tickets = Ticket.all
	end
	private
		def ticket_params
			params.require(:ticket).permit(:title, :application, :summary)
		end
end
