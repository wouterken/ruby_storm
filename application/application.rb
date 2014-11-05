# encoding: utf-8

module Storm
  STORM_DIR = "#{File.dirname(__FILE__)}/../"
  STORM_ENV = ENV['DATABASE_ENV'] || 'development'
  VERSION = ENV['VERSION'] || nil
  DATABASE_DIR = ENV['DATABASE_DIR'] || './db'
  MIGRATIONS_DIR = "#{DATABASE_DIR}/migrate"
end

require "#{Storm::STORM_DIR}/generators/db/migration_generator"
require "#{Storm::STORM_DIR}/generators/db/db_command"
