class StaticPagesController < ApplicationController
	def home
        cookies[:method]='user'
	end
	
	def help
	end
	
	def about
	end
	
	def contact
	end
	

end
