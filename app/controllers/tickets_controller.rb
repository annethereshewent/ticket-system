class TicketsController < ApplicationController
	def create 
		render plain: params[:ticket].inspect
	end
	
	def new
		@user = User.find(session[:user_id])
		@applications = Application.all
	end

	def show
		@tickets = Ticket.all
		render 'index'
	end
	def update 
		user = User.find(session[:user_id])
		@ticket = user.tickets.find(params[:id])

		if @ticket.update(ticket_params)
			@tickets = Ticket.all
			redirect_to tickets_path
		else 
			render 'edit'
		end
	end  
	def closed
		@tickets = Ticket.where('user_id = ? and ticket_status = ?', session[:user_id], 2).order("updated_at DESC")
		render partial: 'closed'
	end
	def open 
		@tickets = Ticket.where('user_id = ? and ticket_status = ? ', session[:user_id], 1).order("updated_at DESC")
		render partial: 'open'
	end
	def create
		user = User.find(session[:user_id])

		if (@ticket = user.tickets.create(ticket_params))
			redirect_to tickets_path
		else
			render 'new', alert: "Unable to submit ticket. An error has occurred."
		end
	end
	def edit
		@applications = Application.all
		@t_statuses = TicketStatus.all
		@ticket = Ticket.find(params[:id])	
	end
	
	def index
		if session[:user_id]
			@tickets = Ticket.where('user_id = ? and ticket_status = ? ', session[:user_id], 1).order("updated_at DESC")
		else
			redirect_to root_path
		end
	end
	private
		def ticket_params
			params.require(:ticket).permit(:title, :application, :ticket_status, :summary)
		end
end
