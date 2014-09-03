class UsersController < ApplicationController
	def index
		if session[:user_id] != nil
			@user = User.find(session[:user_id])
			redirect_to user_tickets_path(@user)
		end

	end
	def authenticate
		@user = User.find_by_username(params[:log_user])
		if @user && @user.authenticate(params[:log_pass])
			session[:user_id] = @user.id
			session[:username] = @user.username
			@tickets = @user.tickets
			redirect_to user_tickets_path(@user), notice: params[:log_user]
		else
			redirect_to root_path, alert: "Incorrect username or password." 
		end
	end
	def validate
		@user = User.find_by_username(params[:username])
		if @user
			render plain: "false"
		else
			render plain: "true"
		end
	end
	def create
		@user = User.new(user_params) 

		# store user id in session


		if @user.save
			session[:user_id] = @user.id
			session[:username] = @user.username
			redirect_to user_tickets_path(session[:user_id])
		else
			redirect_to root_path, notice: "That username is already taken";
		end
	end
	def logout
		reset_session
		redirect_to root_path
	end
	private
		def user_params
			params.require(:user).permit(:username, :password, :password_confirmation)
		end

end
