
require "socket"
require 'io/wait'


server = "chat.freenode.net"
port = "6667"
nick = "Chalky-Bot"
otherbot = "Trivia-Bot"
channel = "#bitbreaker"
private_string = "%6s@()"
greeting_prefix = "privmsg #bitmaker :"
counter =0
message_string = ""

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"




until irc_server.eof do
msg = irc_server.gets.downcase
puts msg
if msg.include? private_string
	answer = private_string.split("^").first
	puts answer
end
#if msg.include? 
#puts msg


	#if msg.include? greeting_prefix and answer
	#response = "nice answer"
	#irc_server.puts "PRIVMSG #{channel} :#{response}"
end
# until irc_server.eof do
# 	msg = irc_server.gets.downcase
# 	puts msg

# 	wasGreeted = false
# 	greetings.each { |g| wasGreeted = true if msg.include? g}

# 	if msg.include? greeting_prefix and wasGreeted
# 		response = "w00t! Someone talked to us !!!! Hello!!!"
# 		irc_server.puts "PRIVMSG #{channel} :#{response}"
	
# 	end
	
# end
