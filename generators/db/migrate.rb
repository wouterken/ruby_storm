require "./generators/db/migration_generator"

module Db
  class Migrate
    `rake db:migrate`
  end
end