# encoding: utf-8
#


base_dir = "#{File.dirname(__FILE__)}/../"

ENV['BUNDLE_GEMFILE'] = File.expand_path("#{base_dir}Gemfile")
STORM_ENV = ENV['DATABASE_ENV'] || 'development'
VERSION = ENV['VERSION'] || nil
MIGRATIONS_DIR = './db/migrate'
APP_NAME = Inflector::classify(File.basename(FileUtils.pwd))

require 'bundler/setup'
Bundler.require(:default)
Dir["#{base_dir}/*.rb","#{base_dir}/*/*.rb"].each{|file| require file }
require "#{base_dir}/generators/db/migration_generator"
require "#{base_dir}/generators/db/db_command"

ActiveRecord::Base.establish_connection YAML.load_file('config/databases.yml')[DATABASE_ENV] rescue nil

