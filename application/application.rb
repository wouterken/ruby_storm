# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'active_record'
require "awesome_print"
require "hirb"
require './application/inflector'
require './application/jazz_hands'



Dir["./*.rb"].each do |file|
  require file
end

DATABASE_ENV = ENV['DATABASE_ENV'] || 'development'
ActiveRecord::Base.establish_connection YAML.load_file('config/databases.yml')[DATABASE_ENV]


