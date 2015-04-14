module ArestaurantHelper
    def fetch
        name = params[:name]
        conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
        sql = "select * from business where name=\'"+name+"\'"
        
        result = 'default'
        conn.exec(sql).fetch do |row|
            result = row.join(',')
            
        end
        conn.commit
        conn.logoff

        result
    end
end