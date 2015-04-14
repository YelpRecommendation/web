class SessionsController < ApplicationController
	
	def new
		@title = "Sign in"

		cookies[:email]="hihi"
		cookies[:passwd]="world"
	end
	
	def create
		email=params[:session][:email]
		passwd=params[:session][:password]

		print '=================='

		

		render text: "==="+email+passwd


	end

	def destroy
	end

end
