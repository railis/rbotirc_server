module RbotircServer
  class MessageHandler
    attr_reader :message, :session

    KNOWN_TYPES = []

    def initialize(message, session)
      @message = message
      @session = session
    end

    def reload_responders
      responders_list = []
      Dir.glob(Configuration.responders_path + "/*") do |f|
        puts f.inspect
        responders_list << File.basename(f, ".rb")
        load f
      end
      puts responders_list.inspect
    end

    def handle
      reload_responders
    end
  end
end
