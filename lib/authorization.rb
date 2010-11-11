require File.dirname(__FILE__) + '/publishare/exceptions'
require File.dirname(__FILE__) + '/publishare/parser'

module Authorization
  require 'rails-authorization-plugin/railtie' if defined?(Rails)
end
