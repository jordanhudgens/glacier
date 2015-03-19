module RubyGenerator

  def ruby_server
    require 'webrick'
    server = WEBrick::HTTPServer.new(:Port => 8080)
    server.mount_proc('/') {|request, response| response.body = File.open("sample.html.erb")}
    trap("INT") {server.shutdown}
    server.start
  end

  def ruby_server_connection
    "require 'webrick'\nserver = WEBrick::HTTPServer.new(:Port => 8080)\nserver.mount_proc('/') {|request, response| response.body = File.open('sample.html.erb')}\ntrap('INT') {server.shutdown}\nserver.start"
  end
  
end