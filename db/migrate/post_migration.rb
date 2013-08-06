require 'active_record'

class PostMigration < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE TABLE IF NOT EXISTS posts (
        id serial PRIMARY KEY,
        headline varchar(255) NOT NULL,
        content text NOT NULL,
        user_id integer NOT NULL,
        published_on date);
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE IF EXISTS posts;
    SQL
  end
end
