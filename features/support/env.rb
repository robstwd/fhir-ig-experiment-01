$LOAD_PATH << File.expand_path('../../../lib',__FILE__)
require 'nokogiri'
require 'rspec'
require 'rubygems'
require 'date'
require "tty-command"
require 'aruba/cucumber'

Dir["#{File.expand_path('../../../spec/support/matchers/matchers', __FILE__)}*.rb"].each {|f| require f}
