class SessionsController < ApplicationController
	
	def new
		@title = "Sign in"
		
	end
	
	def create
		email=params[:session][:email]
		passwd=params[:session][:password]
		
		cookies[:username]=email
		cookies[:passwd]=passwd
		
		
		redirect_to '/search'
	end
	
	def destroy
		cookies.delete(:username)
		cookies.delete(:passwd)
		redirect_to '/home'
	end
	
	def testdb
		require 'moneta'
		
		# Create a simple file store
		store = Moneta.new(:File, dir: 'moneta')
		
		# Store some entries
		store['key2'] = store['key2']<<"s"
		
		# Read entry
		store.key?('key2') # returns true
		testtxt=store['key2'].to_s # returns 'value'
		
		store.close
		
		render text: testtxt
	end
	
end
