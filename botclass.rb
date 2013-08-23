class Bot

	attr_accessor :server, :port, :nick, :channel, :msg_prefix

  def initialize
    @server = "chat.freenode.net"
	@port = "6667"
	@nick = "Chalky-Bot"
	@channel = "#bitbreaker"
	@msg_prefix = "privmsg #bitmaker :"
  end

end