#!/usr/bin/env rake

require 'active_record'
require 'pry'

Dir['db/migrate/*'].each do |file|
  require File.expand_path(file)
end


namespace :db do
  PG_SPEC = {
    :adapter  => 'postgresql',
    :host     => 'localhost',
    :database => 'blog_dev',
    :username => 'postgres',
  }

  def connection(config)
    ActiveRecord::Base.establish_connection(config)
    ActiveRecord::Migration.verbose = false
  end

  def run_migrations(direction, config)
    connection(config)
    ActiveRecord::Migration.descendants.each { |m| m.send(direction) }
  end

  task :migrate do
    run_migrations(:up, PG_SPEC)
  end

  task :rollback do
    run_migrations(:down, PG_SPEC)
  end

  namespace :test do
    def config
      PG_SPEC.merge({:database => 'blog_test'})
    end

    task :prepare do
      run_migrations(:up, config)
    end

    task :rollback do
      run_migrations(:down, config)
    end
  end

end
