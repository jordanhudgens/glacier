module RubyGenerator

  def ruby_server_connection
    "require 'webrick'\nserver = WEBrick::HTTPServer.new(:Port => 8080)\nserver.mount_proc('/') {|request, response| response.body = File.open('launch/get_started.html')}\ntrap('INT') {server.shutdown}\nserver.start"
  end
  
end