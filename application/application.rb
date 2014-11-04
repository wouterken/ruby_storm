# encoding: utf-8
#


base_dir = "#{File.dirname(__FILE__)}/../"

ENV['BUNDLE_GEMFILE'] = File.expand_path("#{base_dir}Gemfile")

module Storm
  STORM_ENV = ENV['DATABASE_ENV'] || 'development'
  VERSION = ENV['VERSION'] || nil
  DATABASE_DIR = ENV['DATABASE_DIR'] || './db'
  MIGRATIONS_DIR = "#{DATABASE_DIR}/migrate"
end

require "#{base_dir}/generators/db/migration_generator"
require "#{base_dir}/generators/db/db_command"
