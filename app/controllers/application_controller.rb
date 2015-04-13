class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  def tcptest
	  
	  
	  #		require 'socket'
	  #
	  #		hostname = '192.168.64.1'
	  #		port = 9997
	  #
	  #		s = TCPSocket.open(hostname, port)
	  #
	  #		#	  while line = s.gets   # Read lines from the socket
	  #		#		  puts line.chop      # And print with platform line terminator
	  #		#	  end
	  #
	  #		s.puts "hello"
	  #		line=s.gets
	  #
	  #		s.close               # Close the socket when done
	  
	  
	  
	  require 'socket'
	  
	  host = '192.168.64.1'     # The web server
	  port = 8078
	  path = "/control"                 # The file we want
	  
	  # This is the HTTP request we send to fetch a file
	  request = "GET #{path} HTTP/1.0\r\n\r\n"
	  
	  socket = TCPSocket.open(host,port)  # Connect to server
	  socket.print(request)               # Send request
	  response = socket.read              # Read complete response
	  
	  print response
	  
	  # Split response at first blank line into headers and body
	  headers,body = response.split("\r\n\r\n", 2)
	  print body                          # And display it
	  
	  render text: response
  end
  
end
