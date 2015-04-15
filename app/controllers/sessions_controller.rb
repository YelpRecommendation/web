class SessionsController < ApplicationController
	
	def new
		@title = "Sign in"

	end
	
	def create
		email=params[:session][:email]
		passwd=params[:session][:password]

		cookies[:username]=email
		cookies[:passwd]=passwd
		
		
		redirect_to "/search"
	end

	def destroy
	end

end
