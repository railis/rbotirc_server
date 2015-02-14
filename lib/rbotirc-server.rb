require 'pry'
Dir.glob(File.expand_path("../" + File.basename(__FILE__, ".*"), __FILE__) + "/*") {|f| require f}

module RbotircServer
end
