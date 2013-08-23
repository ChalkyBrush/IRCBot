#add a module
#lookup github IRC gems

require "socket"
require ("./botclass")

server = "chat.freenode.net"
port = "6667"
nick = "Chalky-Bot"
channel = "#bitbreaker"
greeting_prefix = "privmsg #bitmaker :"
greetings =["hello", "hi"]

irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"

talkingbot=Bot.new
thinkingbot=Bot.new

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
  	if index == number
  		question_to_ask = s.to_s
  		correct_answer = question_to_ask.split("}").last
  		return correct_answer
  	end
	}

end

until irc_server.eof do
msg = irc_server.gets.downcase
puts msg
	randomline=rand(4)
	question=find_question(randomline)
	answer = find_answer(randomline)


irc_server.puts "PRIVMSG #{channel} :#{question}"
sleep(10)
	if msg.include? greeting_prefix and answer
	response = "nice answer"
	irc_server.puts "PRIVMSG #{channel} :#{response}"
	end 
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