module SignupHelper
    def readuser
     conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
     cursor = conn.parse("select * from yelp_user where rownum<5")
     cursor.exec
     col = cursor.getColNames.join(",")
     #r=""
     #while r=cursor.fetch
     #    puts r.join(",")
     #end
     #r
     cursor.close
     conn.logoff
     col
     end
end
