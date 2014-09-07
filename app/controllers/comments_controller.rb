class CommentsController < ApplicationController
	def create
		@user = User.find(session[:user_id])
		@ticket = Ticket.find(params[:comment][:ticket_id])
		@ticket.update(:ticket_status => 1, :updated_at => DateTime.now)
		@comment = @user.comments.create(comment_params)
		redirect_to edit_user_ticket_path(params[:user_id], @ticket)
	end
	private
		def comment_params
			params.require(:comment).permit(:body,:user_id,:ticket_id)
		end
end
