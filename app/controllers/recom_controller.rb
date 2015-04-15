class RecomController < ApplicationController
  def home
      name = params[:name]
      conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
      sql = "insert into new_user values(\'"+name+"\',\'\')"
      conn.exec(sql)
      
      conn.commit
      conn.logoff
      
      cookies[:username]=name
  end
end
