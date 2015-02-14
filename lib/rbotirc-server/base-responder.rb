module RbotircServer
  class BaseResponder
    attr_reader :socket, :message

    def initialize(socket, message)
      @message = message
      @socket = socket
    end

    def respond(str)
      socket.send "PRIVMSG #{Configuration.channel} :#{str}"
    end
  end
end
