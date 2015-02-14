module RbotircServer
  class Configuration
    class << self
      KNOWN_OPTIONS = [:server, :nick, :port, :channel, :responders_path]
      attr_accessor :data

      def defaults
        {
          server: "irc.freenode.com",
          nick: "rbotirc",
          port: 6667,
          channel: "#test"
        }
      end

      class_eval do
        data ||= {}
        KNOWN_OPTIONS.each do |k|
          define_method(k) do
            data[k] || defaults[k]
          end

          define_method(:"#{k}=") do |value|
            data[k] = value
          end
        end
      end
      
      def set &block
        block.call(self)
      end

      def method_missing(method_name, *args)
        if method_name.to_s.scan(/\=/)
          raise "No such setting as '#{method_name.to_s.chop}'"
        else
          super
        end
      end
    end
  end
end
