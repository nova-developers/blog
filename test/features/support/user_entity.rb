class Users < ActiveRecord::Migration

  def self.up(options = {})
    execute %{
      INSERT INTO users (email, password, full_name, gravatar, twitter, bio)
      VALUES (
        '#{options[:email] || "homer@example.com" }',
        '#{options[:password] || "password" }',
        '#{options[:full_name] || "Homer J. Simpson" }',
        '#{options[:gravatar] || "none" }',
        '#{options[:twitter] || "_home_j" }',
        '#{options[:bio] || "Oh, everything looks bad if you remember it." }'
      );
    }
  end

  def self.down
    execute %q{DELETE FROM users;}
  end

end
