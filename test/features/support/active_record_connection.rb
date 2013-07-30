require 'active_record'

PG_SPEC = {
  :adapter  => 'postgresql',
  :host     => 'localhost',
  :database => 'blog_test',
  :username => 'postgres',
}

ActiveRecord::Base.establish_connection(PG_SPEC)
ActiveRecord::Migration.verbose = false
