class SessionsController < ApplicationController
	
	def new
		@title = "Sign in"
		
	end
	
	def create
		email=params[:session][:email]
		
		cookies[:username]=email
        conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
        
        sql = "select * from new_user_category where new_user_category.user_name=\'"+email+"\'"
        cursor1 = conn.parse(sql)
        cursor1.exec
        sql2 = "select * from new_user where username=\'"+email+"\'"
        cursor2 = conn.parse(sql2)
        cursor2.exec
        if cursor1.fetch==nil and cursor2.fetch==nil
            cursor1.close
            cursor2.close
            conn.logoff
            redirect_to '/signup'
        else
            cursor1.close
            cursor2.close
            conn.logoff
            redirect_to '/search'
        end
 
	end
	
	def destroy
		cookies.delete(:username)
        
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
