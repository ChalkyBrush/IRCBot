
require "socket"
require 'io/wait'


server = "chat.freenode.net"
port = "6667"
nick = "Chalky-Bot"
otherbot = "Chalky-Bot"
channel = "#bitmaker"
answer ="&*$@ruf!adfb"
private_string = "%6s@()"
answering_user =""
winmessage =""
winnerdecided=false
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
	winnerdecided=false
	puts answer
	answer = msg.split("{").last
	answer = answer.split("}").first
	puts answer
end
puts "#{answer} before the if statement"
if msg.include? answer and !msg.include? "trivia-bot" and winnerdecided==false
	winnerdecided=true
	answering_user = msg.split("!").first
	answering_user = answering_user.split(":").last
	puts answering_user
		File.open("answering_user.txt", "w") do |x|
		x.puts answering_user
		end
	win_message = "Congratulations #{answering_user}, you answered correctly!"

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
