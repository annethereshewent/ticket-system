class TicketsController < ApplicationController
	def create 
		render plain: params[:ticket].inspect
	end
	
	def new
		@applications = Application.all
	end

	def show
		@tickets = Ticket.all
		render 'index'
	end
	def update 
		@ticket = Ticket.find(params[:id])

		if @ticket.update(ticket_params)
			@tickets = Ticket.all
			redirect_to tickets_path
		else 
			render 'edit'
		end
	end  
	def closed 
		@tickets = Ticket.where(ticket_status: 2)
		respond_to do |format|
			format.js
		end
	end
	def create 
		@ticket = Ticket.new(ticket_params)

		if @ticket.save
			redirect_to tickets_path
		else
			@errormsg = '<p style="color:red">An error has occurred</p>'
			render 'new'
		end
	end
	def edit
		@applications = Application.all
		@t_statuses = TicketStatus.all
		@ticket = Ticket.find(params[:id])
		
	
	end
	
	def index
		@tickets = Ticket.where.not(ticket_status: 2).order("created_at DESC");
	end

	private
		def ticket_params
			params.require(:ticket).permit(:title, :application, :ticket_status, :summary)
		end
end
