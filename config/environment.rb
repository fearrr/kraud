# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
Paperclip.options[:command_path] = "/usr/bin/"