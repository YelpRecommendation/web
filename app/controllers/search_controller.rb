class SearchController < ApplicationController
  def home
	  method = params[:method]
      if method==nil
          method="rating"
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
									   
									   order by stars desc),
                                       idssort as(
                                                  select id
                                                  from ids
                                                  where rownum<=10)
									   select distinct(business.name), business.full_address, business.city, business.state, business.stars
									   from  idssort
									   inner join business on business_id=idssort.id
"
la=cookies[:la]
lo=cookies[:lo]
if la==nil
    la="39"
    end
if lo==nil
    lo="-78"
    end
sqllocation="with pre as(select b.name, full_address, city, state,stars,POWER(("+la+"-latitude),2)+POWER(("+lo+"-longitude),2) AS dist
from business b,new_user_category nu,categories
where categories.business_id=b.business_id and
nu.category=categories.category
and nu.user_name='"+cookies[:username]+"'
order by dist asc)
select *
from pre
where rownum<=10"

sqlsimiuser="select b.name, full_address, city, state,stars
from business b,new_user
where new_user.username='"+cookies[:username]+"'
and new_user.business_id=b.business_id
and rownum<=10"

    sql=sqluser
					 if method=="rating"
                         sql=sqlrating
                         else
                            if method=="location"
                                sql=sqllocation
                            else
                                if method=="simiuser"
                                    sql=sqlsimiuser
                                else
                                    sql=sqluser
                                end
                            end
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
	  redirect_to generate_url("http://52.6.219.16:3001/testdir", :toaddr => params[:address].gsub("_"," "))
  end
  
  def testgeo
	  res=location.request
	  
	  render text: res.latitude
  end
end
