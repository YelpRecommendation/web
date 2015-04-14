class WaitController < ApplicationController
  def home
      require 'socket'
      
      host = '192.168.64.1'     # The web server
      port = 8078
      path = "/control"                 # The file we want
      
      cate = params[:value]
      # This is the HTTP request we send to fetch a file
      request = "POST #{path} HTTP/1.0\r\n\r\nusername=&content="
      
      socket = TCPSocket.open(host,port)  # Connect to server
      socket.print(request)               # Send request
      response = socket.read              # Read complete response
      
      print response
      
      # Split response at first blank line into headers and body
      headers,body = response.split("\r\n\r\n", 2)
      print body                          # And display it
      
      
  end
end
