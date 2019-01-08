ENV["RAILS_ENV"] = 'development'
require File.expand_path("../../config/environment", __FILE__)
ActiveRecord::Base.establish_connection
require 'rspec/rails'
#require 'rspec/autorun'

require 'simplecov'
SimpleCov.start 'rails'