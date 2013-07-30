class Posts < ActiveRecord::Migration

  def self.up
    execute  %q{
      INSERT INTO posts (headline, content) VALUES ('A Fishful of Dollars', 'Mo money, mo fish');
      }
  end

  def self.down
    execute %q{DELETE FROM posts;}
  end
end
