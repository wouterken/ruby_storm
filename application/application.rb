# encoding: utf-8
require 'fileutils'

module Storm
  STORM_DIR = "#{File.dirname(__FILE__)}/../"
  STORM_ENV = ENV['DATABASE_ENV'] || 'development'
  VERSION = ENV['VERSION'] || nil
  DATABASE_DIR = ENV['DATABASE_DIR'] || './db'
  MIGRATIONS_DIR = "#{DATABASE_DIR}/migrate"
  APP_DIR = File.expand_path("./")
  APP_NAME = ENV['APP_NAME'] || Inflector::classify(File.basename(FileUtils.pwd))
end
