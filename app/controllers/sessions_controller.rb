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
    
    def facebook
        name = cookies[:username]
        conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
        sql = "select business.name,business.full_address,business.city,state,stars,open from new_user,business where new_user.username=\'"+name+"\' and new_user.business_id=business.business_id"
        cursor = conn.parse(sql)
        cursor.exec
        if cursor.fetch==nil
            cursor.close
            conn.logoff
            redirect_to '/recom'
        else
            cursor.close
            conn.logoff
            redirect_to '/search'
        end
    end
	
end
