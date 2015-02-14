require 'socket'

module RbotircServer
  class Socket
    attr_reader :server, :port, :irc_socket
    def initialize(server, port)
      @server = server
      @port = port
      @irc_socket = TCPSocket.open(@server, @port)
    end

    def send(msg)
      puts ">> #{msg}"
      @irc_socket.send("#{msg}\n", 0)
    end

    def connect!(nick, channel)
      send "USER blah blah blah :blah blah"
      send "NICK #{nick}"
      send "JOIN #{channel}"
    end

    def main_loop(&block)
      while true
        return if irc_socket.eof
        block.call(irc_socket.gets)
      end
    end
  end
end
