require 'webrick'
server = WEBrick::HTTPServer.new(:Port => 8080)
server.mount_proc('/') {|request, response| response.body = File.open('launch/get_started.html')}
trap('INT') {server.shutdown}
server.start