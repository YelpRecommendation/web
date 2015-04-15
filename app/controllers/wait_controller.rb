class WaitController < ApplicationController
	def home


		cate = params[:selected]
		name = cookies[:username]
		
		
		
		
		
		
		content=""
		
		len = cate.length
		
		if len >= 1
			content=cate[0]
			if len >= 2
				for i in 2..len
					content+="$"+cate[i-1]
				end
			end
		end
		
		
		
		
		
#		require "net/http"
#		require "uri"
#		
#		uri = URI.parse("http://165.123.216.212:8081/Recommendation/rec")
#		
#		http = Net::HTTP.new(uri.host, uri.port)
#		
#		request = Net::HTTP::Post.new(uri.request_uri)
#		request.set_form_data({"username" => name, "content" => content})
#		
#		response = http.request(request)


		

		
		redirect_to "/search"
	end
end
