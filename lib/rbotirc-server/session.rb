module RbotircServer
  class Session
    attr_reader :configuration, :socket

    def initialize
      @configuration = Configuration
      @socket = Socket.new(configuration.server, configuration.port)
    end

    def start!
      socket.connect!(configuration.nick, configuration.channel)
      socket.main_loop do |raw_msg|
        print Formatter.new(raw_msg).format
        if MessageWrapper.is_a_channel_command?(raw_msg)
          MessageHandler.new(MessageWrapper.new(raw_msg), self).handle
        end
      end
    end
  end
end
