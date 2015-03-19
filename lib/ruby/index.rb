require 'webrick'
server = WEBrick::HTTPServer.new(:Port => 8080)
server.mount_proc('/') {|request, response| response.body = File.open("sample.html.erb")}
# server.mount_proc('/coolstory') {|request, response| response.body = File.open("coolstory.html.erb")}
# server.mount_proc('/yay') {|request, response| response.body = File.open("yay.html.erb")}
trap("INT") {server.shutdown}
server.start