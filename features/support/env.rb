# rubocop:disable Style/MixinUsage
require 'dotenv/load'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'pp'
require 'rspec/expectations'
require 'pry'
require 'byebug'
require 'pry-byebug'
require 'os'
require 'imatcher'
require 'data_magic'
require 'yaml'
require 'chilkat'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/core_ext/hash/indifferent_access'
require 'date'
require 'roo'
require 'require_all'
require 'bcrypt'

include RSpec::Matchers
include DataMagic
require_relative '../helpers/api_base_helper'
include ApiBaseHelper

$root_directory = Dir.pwd
# rubocop:enable Style/MixinUsage
