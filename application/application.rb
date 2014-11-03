# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'active_record'
require 'awesome_print'
require 'hirb'
require 'fileutils'

Dir["#{File.dirname(__FILE__)}/../*.rb","#{File.dirname(__FILE__)}/*.rb"].each{|file| require file }

STORM_ENV = ENV['DATABASE_ENV'] || 'development'
VERSION = ENV['VERSION'] || nil
MIGRATIONS_DIR = './db/migrate'

APP_NAME = Inflector::classify(File.basename(FileUtils.pwd))

FileUtils.mkdir_p(MIGRATIONS_DIR) rescue nil
ActiveRecord::Base.establish_connection YAML.load_file('config/databases.yml')[DATABASE_ENV]


