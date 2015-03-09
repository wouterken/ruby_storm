module Storm::Db
  class Storm::MigrationGenerator
      require 'active_record'
    def self.next_migration_file_name(args)
      ::Inflector::tableize("#{Time.now.strftime("%Y%m%d%H%M%S")}_#{self.name.split("::").last}_#{args[0]}")+".rb"
    end

    def self.last_migration_timestamp
    end
  end
end