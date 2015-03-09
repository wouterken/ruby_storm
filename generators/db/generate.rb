require 'fileutils'
require "#{Storm::STORM_DIR}/generators/db/migration_generator"

module Storm::Db
  class Generate < Storm::MigrationGenerator
    def self.start(args)
      filename = next_migration_file_name(args)
      model_name, *columns = args
      model_source = Inflector::singularize(Inflector::tableize(model_name))
      create_table = \
      ["class Generate#{::Inflector::pluralize(::Inflector::classify(model_name))} < ActiveRecord::Migration",
      "  def change",
      "    create_table :#{::Inflector::tableize(model_name)} do |t|",
            columns.map do |col|
              col_name, col_type = col.split(":")
              col_type ||= "string"
              "      t.#{col_type} :#{::Inflector::singularize(::Inflector::tableize(col_name))}"
            end,
       "      t.timestamps(null: false)",
       "     end",
       "  end",
       "end"].flatten

      FileUtils.mkdir_p("./models/")
      File.open("./models/#{model_source}.rb", "w+") do |f|
        f.puts "\
class #{::Inflector::classify(model_name)} < ActiveRecord::Base
end
"
      end
      File.open("./db/migrate/#{filename}", "w+") do |f|
        f.puts create_table.join("\n")
      end
    end
  end
end
