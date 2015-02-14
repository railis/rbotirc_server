require 'rainbow'

module RbotircServer
  class Formatter
    attr_reader :raw

    def initialize(raw)
      @raw = raw
    end

    def format
      add_time(raw)
    end

    private

    def add_time(str)
      time = Time.now
      result = Rainbow(time.strftime("%H:%M:%S %d-%m-%Y")).blue + " >>> " + str
    end
  end
end
