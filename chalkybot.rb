#add a module
#lookup github IRC gems

require "socket"
require 'io/wait'

server = "chat.freenode.net"
port = "6667"
nick = "Trivia-Bot"
otherbot ="Chalky-Bot"
channel = "#bitmaker"
private_string = "%6s@()"
greeting_prefix = "privmsg #bitmaker :"
initiated = false
greetings =["hello", "hi"]
counter =0
message_string = ""
answering_user = ""

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"


def find_question(number)
	File.open("questions.txt", "r").readlines.each_with_index { |s , index|
  	if index == number
  		question_to_ask = s.to_s
  		return question_to_ask.split("}").first
  	end
	}

end

def find_answer(number)
	File.open("questions.txt", "r").readlines.each_with_index { |s , index|
  	puts s
  	if index == number
  		question_to_ask = s.to_s
  		correct_answer = question_to_ask.split("}").last.chomp
  		puts correct_answer
  		return correct_answer
  	end
	}

end


until irc_server.eof do

msg = irc_server.gets.downcase


puts msg

	message_string = ""
	randomline=rand(59)
	question=find_question(randomline)
	answer = find_answer(randomline)
	if initiated==true
		irc_server.puts "PRIVMSG #{channel} :#{question}"
		irc_server.puts "PRIVMSG #{otherbot} :{#{answer}}#{private_string}"
	end
	sleep(15)
	if initiated==false
	irc_server.puts "PRIVMSG #{channel} :Hello #{channel}, my name's Trivia-Bot. First person to answer my question wins nothing!"
	initiated =true
	end
	answering_user = File.open("answering_user.txt", "r").read.chomp
	if answering_user == ""
		if initiated==true
		irc_server.puts "PRIVMSG #{channel} :Nobody answered my question correctly! The correct answer is: #{answer}"
		end
	else
		puts File.open("answering_user.txt", "r").read.chomp
		
		irc_server.puts "PRIVMSG #{channel} :#{answering_user} had the correct answer first with: #{answer}"

			File.open("answering_user.txt", "w") do |x|
			x.puts ""
			end
	end

	# if msg.include? greeting_prefix and answer
	# response = "nice answer"
	# irc_server.puts "PRIVMSG #{channel} :#{response}"
	# end 
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