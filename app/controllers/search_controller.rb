class SearchController < ApplicationController
  def home
	  
	  
	  conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
	  
	  sql = "with usercount as ( select user_id,count(*) as num
	  from categories,review
	  where review.business_id=categories.business_id
	  and review.category in (select category from new_user_cate where new_user_cate.user='"+cookies[:username]+"')
	  group by user_id
	  order by num desc),
	  bestuser as( select *
				  from usercount
				  where rownum <= 10)，
				  ids as (
						  select business_id
						  from review,bestuser
						  where review.user_id=bestuser.user_id
						  and rownum <= 10
						  order by stars desc)
						  select business.name,business.full_address,business.city,state,stars from business where business_id=ids.business_id
						  "
						  
						  require 'moneta'
						  
						  # Create a simple file store
						  store = Moneta.new(:File, dir: 'moneta')
						  
						  
						  #		ids=[]
						  #
						  #		conn.exec(sql).fetch do |row|
						  #			ids<<row[0]
						  #		end
						  
						  #		store[key]=ids
						  
						  key=name+method;
						  matrix
						  if store.key?(key)
							  matrix=store[key]
							  else
							  matrix=conn.exec(sql).fetch;
						  end
						  
						  store.close
	  
  end
  
  def testloc
	  loc=request.location.latitude
	  render text: loc
  end
end
