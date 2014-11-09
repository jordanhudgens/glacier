require 'webrick'
server = WEBrick::HTTPServer.new(:Port => 8080)
server.mount_proc('/') {|request, response| response.body = File.open("sample.html.erb")}
trap("INT") {server.shutdown}
server.start