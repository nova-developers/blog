require 'active_record'

class UserMigration < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS users (
        id serial PRIMARY KEY,
        email varchar(255) NOT NULL,
        password varchar(255) NOT NULL,
        full_name varchar(255) NOT NULL,
        gravatar varchar(255),
        twitter varchar(255),
        bio text NOT NULL);
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE IF EXISTS users;
    SQL
  end

end
