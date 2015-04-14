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
	  
	  
	  print 'starting...\n'
	  
	  require 'socket'
	  
	  host = '158.130.107.137'     # The web server
	  port = 8081
	  path = "/control"                 # The file we want
	  
	  head='POST /Recommendation/rec HTTP/1.1\r\n'
	  body='username=ceexe&content=we de mde '
	  header1='Host: 158.130.107.137\r\nContent-Type: application/x-www-form-urlencoded\r\nUser-agent: tcptest\r\nContent-Length: '+body.length.to_s+'\r\n\r\n'
	  
	  
	  
	  
	  # This is the HTTP request we send to fetch a file
	  request = "#{head}#{header1}#{body}"
	  print 'request:['+request+']'
	  print "openning socket...\r\n"
	  socket = TCPSocket.open(host,port)  # Connect to server
	  print "writing socket...\r\n"
	  socket.write(request)               # Send request
	  socket.flush;
	  print "reading socket...\r\n"

	  response = socket.read              # Read complete response
	  
	  print "got response...\n"
	  print response
	  
	  print "end of response...\n"
	  
	  # Split response at first blank line into headers and body
	  headers,body = response.split("\r\n\r\n", 2)
	  print body                          # And display it
	  
	  render text: response+'123'
  end
  
end
