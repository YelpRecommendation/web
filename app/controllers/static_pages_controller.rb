class StaticPagesController < ApplicationController
	def home
	end
	
	def help
	end
	
	def about
	end
	
	def contact
	end
	
	def login
		render text: hi
	end
	
	def test3
#		render text:
#		
#		%{
#		<div class="center jumbotron">
#		<h1>Welcome to Yelp Recommendation App TEST3</h1>
#		
#		<h2>
#		This is the home page for the Yelp Recommendation App
#		</h2>
#		
#		<%= link_to "Sign up now!", signup_path, class:"btn btn-lg btn-primary"%>
#		</div>
#		
#		<%= link_to image_tag("food.jpg",alt:"Business"),'#'%>'
#		}
require 'socket'

host = '192.168.64.1'     # The web server
port = 8078
path = "/control"                 # The file we want

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"
render text: 'hi'
	end
end
