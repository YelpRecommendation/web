class WaitController < ApplicationController
	def home

		cate = params[:selected]
		name = cookies[:username]
		
		content=""
		
		len = cate.length
		
		# if len >= 1
		# 	content=cate[0]
		# 	if len >= 2
		# 		for i in 2..len
		# 			content+="$"+cate[i-1]
		# 		end
		# 	end
		# end
	
		if len >= 1
			content="category=\'"+cate[0]+"\'"
			if len >= 2
				for i in 2..len
					content+="or category=\'"+cate[i-1]+"\'"
				end
			end
		end

		conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
		
		for i in 0..len-1
		sql = "insert into new_user_cate values('"+name+"',"+"'"+cate[i]+"')"
		end

		conn.exec(sql)

		# require "net/http"
		# require "uri"
		
		# uri = URI.parse("http://158.130.104.9:8081/Recommendation/rec")
		
		# http = Net::HTTP.new(uri.host, uri.port)
		
		# request = Net::HTTP::Post.new(uri.request_uri)
		# request.set_form_data({"username" => name, "content" => content})
		
		# response = http.request(request)



		
		redirect_to "/search"
	end
end
