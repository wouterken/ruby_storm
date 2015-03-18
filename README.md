 [![Ruby Storm](https://img.shields.io/badge/Ruby Storm-Ruby%20Stand%20alone%20object%20relational%20mapper-blue.svg)](Ruby Storm)
[![Gem Version](https://badge.fury.io/rb/ruby_storm.svg)](http://badge.fury.io/rb/ruby_storm)
[![Downloads](https://img.shields.io/gem/dt/ruby_storm/stable.svg)](https://img.shields.io/gem/dt/ruby_storm)
[![Inline docs](http://inch-ci.org/github/wouterken/ruby_storm.svg?branch=master)](http://inch-ci.org/github/wouterken/ruby_storm)

### Ruby Storm

Ruby Storm is a light-weight  **st**and-alone ***o***bject **r**elational **m**apper wrapping the functionality of the Rails active record library into a light-weight tool.

You can use ruby storm to generate minimal applications with full support for active-record, migrations, basic model generation and an interactive console.

#### Installation

```ruby
gem install ruby_storm
```

#### Usage

* Generating a new project

````
storm init my_new_project
cd my_new_project
````

* You can edit the ./db/database.yml file to use alternate DB configurations. Read the [ActiveRecord](https://github.com/rails/rails/tree/master/activerecord) documentation for more details.

* DB create/drop commands


````
storm db:create
storm db:drop
````

* Generating a new model (and migration in a project)

````
storm db:generate MyModel first_name:string last_name:string order:integer happy:boolean
````
* Performing migrations

```
storm db:migrate
```

* Rollbacks

```
storm db:rollback
STEP=5 storm db:rollback
```
* Version

```
storm db:version
```

* Update existing models

```
storm db:modify MyModel
```

### Storm console
The storm console can be started from the project root directory and will auto-load all of your storm models.

```
storm console
```

### Storm application
You storm app can function as a traditional c-style application and has a 'main' entry point in the generated application file.
You can start your storm app by executing the following from the project directory.

```
storm start
```

### Tasks
You can add additional tasks to your storm application similar to Rake tasks.
In the application file add a class function with the name of the task you wish to add. You can then execute that task from the command line with an optional number of arguments.

```ruby
## In main app file.
def self.my_task(args)
  print args
end

## From command line
storm app my_task arg1 arg2

# Outputs => ["arg1", "arg2"]
```