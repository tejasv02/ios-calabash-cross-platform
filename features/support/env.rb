# encoding: utf-8
puts "selecting #{ENV['PLATFORM']} platform"

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/ibase'
  require_relative '../../features/ios/base_page'
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require_relative '../../features/android/base_page'
end

World(TestModule)
