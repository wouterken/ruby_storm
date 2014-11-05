
module Storm::Db
  class Create  < Storm::DBCommand
    def self.start(args)
      options = {:charset => 'utf8', :collation => 'utf8_unicode_ci'}

      create_db = lambda do |config|
        # drops and create need to be performed with a connection to the 'postgres' (system) database
        if config["adapter"] == 'postgres'
          ::ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres', 'schema_search_path' => 'public'))
        end
        # drop the old database (if it exists)
        ::ActiveRecord::Base.connection.drop_database config["database"] rescue nil
        # create new
        ::ActiveRecord::Base.connection.create_database(config["database"]) rescue nil
        ::ActiveRecord::Base.establish_connection(config)
      end

      begin
        create_db.call self.config
      rescue Exception => sqlerr
        if sqlerr.errno == 1405
          print "#{sqlerr.error}. \nPlease provide the root password for your mysql installation\n>"
          root_password = $stdin.gets.strip

          grant_statement = <<-SQL
            GRANT ALL PRIVILEGES ON #{config['database']}.*
              TO '#{config['username']}'@'localhost'
              IDENTIFIED BY '#{config['password']}' WITH GRANT OPTION;
          SQL

          create_db.call config.merge('database' => nil, 'username' => 'root', 'password' => root_password)
        else
          $stderr.puts sqlerr.error
          $stderr.puts "Couldn't create database for #{config.inspect}, charset: utf8, collation: utf8_unicode_ci"
          $stderr.puts "(if you set the charset manually, make sure you have a matching collation)" if config['charset']
        end
      end
    end
  end
end