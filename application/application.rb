# encoding: utf-8
require 'fileutils'
require_relative '../generators/version'

module Storm
  STORM_DIR      = File.expand_path("#{File.dirname(__FILE__)}/../")
  STORM_ENV      = ENV['DATABASE_ENV'] || 'development'
  DB_VERSION     = ENV['DB_VERSION']   || nil
  DATABASE_DIR   = ENV['DATABASE_DIR'] || './db'
  APP_NAME       = ENV['APP_NAME']     || Inflector::classify(File.basename(FileUtils.pwd))
  MIGRATIONS_DIR = "#{DATABASE_DIR}/migrate"
  APP_DIR        = File.expand_path("./")

  def self.env
    STORM_ENV
  end

  def self.version
    Storm::Version.to_s
  end

  def self.app_name
    APP_NAME
  end
end
