class SearchController < ApplicationController
  def home
  end
  
  def testloc
	  loc=request.location.latitude
	  render text: loc
  end
end
