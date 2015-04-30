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
			sql = "insert into new_user_category values('"+name+"','"+cate[i]+"')"
			conn.exec(sql)
		end
		conn.commit
		conn.logoff
		
		
		
		require "net/http"
		require "uri"
		uri = URI.parse("http://ec2-52-6-130-13.compute-1.amazonaws.com/Recommendation/rec")
		#		 uri = URI.parse("http://165.123.210.122:8081/Recommendation/rec")
		print 2
		http = Net::HTTP.new(uri.host, uri.port)
		print 3
		request = Net::HTTP::Post.new(uri.request_uri)
		print 4
		tosendcat=cate[0]
		for i in 1..len-1
			tosendcat+="$"+cate[i]
		end
		request.set_form_data({"username" => name, "content" => tosendcat})
		print 5
		response = http.request(request)
		print response
		
		
		
		redirect_to "/search"
	end
	
	def java
#		 require "net/http"
#		 require "uri"
#		 print 1
#		 uri = URI.parse("http://ec2-52-6-130-13.compute-1.amazonaws.com/Recommendation/rec")
##		 uri = URI.parse("http://165.123.210.122:8081/Recommendation/rec")
#		print 2
#		 http = Net::HTTP.new(uri.host, uri.port)
#		print 3
#		 request = Net::HTTP::Post.new(uri.request_uri)
#		print 4
#		 request.set_form_data({"username" => "testjava2", "content" => "Seafood$Diners"})
#		print 5
#		 response = http.request(request)
#		print 6
#		print response
#		render text: response
	end
end
