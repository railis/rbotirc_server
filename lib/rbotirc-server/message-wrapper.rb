module RbotircServer
  class MessageWrapper
    attr_reader :raw_msg

    CHANNEL_CMD_REGEX = /^\:\w+\!\~\w+\@\w+\W+[A-Z]+/

    def self.is_a_channel_command?(raw_msg)
      !raw_msg.scan(CHANNEL_CMD_REGEX).empty?
    end

    def initialize(raw_msg)
      @raw_msg = raw_msg
    end

    def command
      wrap_command[get_command_string]
    end

    def text
      if command == :message
        raw_msg.split(':').last.strip
      end
    end

    def sender
      raw_msg.scan(/^\:\w+\!/).last[1..-2]
    end

    def target
    end

    private

    def get_command_string
      raw_msg.scan(/[A-Z]+/).first
    end

    def wrap_command
      {
        "MODE" => :mode,
        "PRIVMSG" => :message,
        "JOIN" => :join,
        "PART" => :part,
        "NICK" => :nick
      }
    end
  end
end
