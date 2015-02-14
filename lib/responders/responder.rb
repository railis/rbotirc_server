module RbotircServer
  class DefaultResponder
    def self.respond(msg)
      if msg =~ /dupa/
        "cyckisss"
      end
    end
  end
end
