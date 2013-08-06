class Posts < ActiveRecord::Migration

  def self.up
    execute  %q{
      INSERT INTO posts (headline, content, user_id)
      VALUES ('A Fishful of Dollars', 'Mo money, mo fish', 1);
      }
  end

  def self.down
    execute %q{DELETE FROM posts;}
  end
end
