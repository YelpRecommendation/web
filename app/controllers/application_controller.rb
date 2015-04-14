class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	
	
	def tcptest

		require "net/http"
		require "uri"
		
		uri = URI.parse("http://165.123.216.212:8081/Recommendation/rec")
	 
		http = Net::HTTP.new(uri.host, uri.port)
		
		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data({"username" => "ceexe", "content" => "5we$de$mde"})
		
		response = http.request(request)
		
		
		
		render text: "finished\n"+response.body
	end
	
end
