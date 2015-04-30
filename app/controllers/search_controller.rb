class SearchController < ApplicationController
  def home
	  method = params[:method]
      if method==nil
          method="user"
      end
	  sqlrating="
	  with rating as(select business.name, business.full_address,city,state,stars,review_count
					 from business,categories,new_user_category
					 where new_user_category.user_name='"+cookies[:username]+"'
					 and new_user_category.category=categories.category
					 and business.business_id=categories.business_id
					 order by stars desc)
					 select *
					 from rating
					 where rownum <= 10
	  "
	  
	  sqluser=
"
with usercount as (
				   select user_id,count(*) as num
				   from categories,review
				   where review.business_id=categories.business_id
				   and categories.category in
				   (select category from new_user_category
					where new_user_category.user_name='"+cookies[:username]+"')
				   group by user_id
				   order by num desc),
				   bestuser as( select *
							   from usercount
							   where rownum <= 10),
							   ids as (
									   select review.business_id as id
									   from review,bestuser,categories
									   where review.user_id=bestuser.user_id
									   and review.business_id=categories.business_id
									   and categories.category in
									   (select category from new_user_category
										where new_user_category.user_name='"+cookies[:username]+"')
									   and rownum <= 10
									   order by stars desc)
									   select distinct(business.name), business.full_address, business.city, business.state, business.stars
									   from business
									   inner join ids on business_id=ids.id
"
						  
						  
					 if method=="rating"
                         sql=sqlrating
                         else
                         sql=sqluser
                         end
                     print sql
                     
						  require 'moneta'
						  
						  # Create a simple file store
						  store = Moneta.new(:File, dir: 'moneta')
						  
						  
						  #		ids=[]
						  #
						  #		conn.exec(sql).fetch do |row|
						  #			ids<<row[0]
						  #		end
						  
						  #		store[key]=ids
						  
						  key=cookies[:username]+method;
						  
						  
print "checking local\n\n"
						  if store.key?(key)
							  else
print "start to fetch\n\n"
							  
							  
							  matrix=[]
							  
							  conn = OCI8.new('jackchen','cis5502015','jackdb.cipsboubatuq.us-east-1.rds.amazonaws.com:1521/TESTRDS')
							 
                                  
							  conn.exec(sql).fetch do |row|
								  print "\nName:"+row[0]
									matrix<<row
							  end
							  
							  store[key]=matrix
print "finished to fetch\n\n"
						  end
						  
print "take the fetch from local\n\n"
						  matrix=store[key]
						  
						  store.close
	  
  end
  
  def testloc
#	  loc=request.location.latitude
#	  render text: loc
  end
  
  def generate_url(url, aparams = {})
	  uri = URI(url)
	  uri.query = aparams.to_query
	  uri.to_s
  end
  
  def testmap
	  #params[:address]="Walmart supermarket center"
	  redirect_to generate_url("http://localhost:3001/testdir", :toaddr => params[:address].gsub("_"," "))
  end
  
  def testgeo
	  res=location.request
	  
	  render text: res.latitude
  end
end
