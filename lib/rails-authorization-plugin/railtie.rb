require 'authorization'
require 'rails'

module Authorization
  class Railtie < Rails::Railtie
    railtie_name :authorization
    
    initializer "authorization.initialize_base"do |app|
      require 'base'
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send( :include, Authorization::Base ) if defined?(ActionController)
      end
      ActiveSupport.on_load :action_vie do
        ActionView::Base.send( :include, Authorization::Base::ControllerInstanceMethods ) if defined?(ActionView)  
      end
    end
  end
end     



# You can perform authorization at varying degrees of complexity.
# Choose a style of authorization below (see README.txt) and the appropriate
# mixin will be used for your app.

# When used with the auth_test app, we define this in config/environment.rb
# AUTHORIZATION_MIXIN = "hardwired"
if not Object.constants.include? "AUTHORIZATION_MIXIN"
  AUTHORIZATION_MIXIN = "object roles"
end

case AUTHORIZATION_MIXIN
  when "hardwired"
    require File.dirname(__FILE__) + '/../publishare/hardwired_roles'
    ActiveRecord::Base.send( :include, 
      Authorization::HardwiredRoles::UserExtensions, 
      Authorization::HardwiredRoles::ModelExtensions 
    )
  when "object roles"
    require File.dirname(__FILE__) + '/../publishare/object_roles_table'
    ActiveRecord::Base.send( :include, 
      Authorization::ObjectRolesTable::UserExtensions, 
      Authorization::ObjectRolesTable::ModelExtensions
    )
end
