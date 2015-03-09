require "#{Storm::STORM_DIR}/generators/db/migration_generator"

module Storm::Db
  class Modify < Storm::MigrationGenerator
    def self.start(args)
      filename = next_migration_file_name(args)
      model_name, *_ = args

      create_table = \
      ["class Modify#{::Inflector::classify(model_name)} < ActiveRecord::Migration",
      "  def change",
       "  end",
       "end"].flatten

      File.open("./db/migrate/#{filename}", "w+") do |f|
        f.puts create_table.join("\n")
      end
    end
  end
end
