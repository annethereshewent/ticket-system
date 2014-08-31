class CommentsController < ApplicationController
	def create
		@user = User.find(session[:user_id])
		@ticket = @user.tickets.find(params[:ticket_id])
		@comment = @ticket.comments.create(comment_params)
		redirect_to edit_ticket_path(@ticket)
	end
	private
		def comment_params
			params.require(:comment).permit(:body,:user_id)
		end
end
