require_relative "db_command"

module Storm::Db
  class Create  < Storm::DBCommand
    def self.start(args)
      options = {:charset => 'utf8', :collation => 'utf8_unicode_ci'}

      create_db = lambda do |config|
        # drops and create need to be performed with a connection to the 'postgres' (system) database
        ::ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres', 'schema_search_path' => 'public')) if self.postgres?
        # drop the old database (if it exists)
        ::ActiveRecord::Base.connection.drop_database config["database"] rescue nil
        # create new
        ::ActiveRecord::Base.connection.create_database(config["database"])
        ::ActiveRecord::Base.establish_connection(config)
      end

      begin
        create_db.call self.config
      rescue Exception => create_exception
        $stderr.puts create_exception
        $stderr.puts "Couldn't create database for #{config.inspect}, charset: utf8, collation: utf8_unicode_ci"
        $stderr.puts "(if you set the charset manually, make sure you have a matching collation)" if config['charset']
      end
    end
  end
end