ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!                                  #PR204
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login_as(user)                                                      #PR204
    session[:user_id] = users(user).id
  end

  def logout                                                              #PR204
    session.delete :user_id
  end

  def setup                                                               #PR204
    login_as :one if defined? session
  end  
end
