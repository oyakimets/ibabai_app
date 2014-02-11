class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ChartsHelper
  require 'active_support/core_ext/object/inclusion.rb'
      
end
