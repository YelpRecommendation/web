class MyAccountController < ApplicationController
  def home
      name = params[:friendname]
      print 1
      if name!=nil
          print 2
          username = cookies[:username]
          print 3
          sql = "insert into friends values('"+username+"','"+name+"')"
          conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
          print 4
          conn.exec(sql)
          conn.commit
          conn.logoff
          print 5
          params.delete(:friendname)
          print 6
      end
  end
end
