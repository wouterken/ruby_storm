require "./generators/db/migration_generator"

module Db
  class Generate < MigrationGenerator
    def self.start(args)
      filename = next_migration_file_name(args)
      model_name, *columns = args

      create_table = \
      ["class Generate#{Inflector::pluralize(Inflector::classify(model_name))} < ActiveRecord::Migration",
      "  def change",
      "    create_table :#{::Inflector::tableize(model_name)} do |t|",
            columns.map do |col|
              col_name, col_type = col.split(":")
              col_type ||= "string"
              "      t.#{col_type} :#{::Inflector::tableize(col_name)}"
            end,
       "    end",
       "  end",
       "end"].flatten

      File.open("./db/migrate/#{filename}", "w+") do |f|
        f.puts create_table.join("\n")
      end
    end
  end
end