class SessionsController < ApplicationController
	def create
		user = User.find_by_email(params[:email])  
		if user && user.authenticate(params[:password]) 
			session[:user_id] = user.id     
			redirect_to user_path(:id => session[:user_id])
			flash[:notice] = "Welcome back, #{user.email}"   
		else 
			flash[:notice] = "Invalid email or password"
			redirect_to '/'
		end
	end

	def destroy

		session[:user_id] = nil
		flash[:notice] = "You successfully logged out."
		redirect_to '/'

	end
end
