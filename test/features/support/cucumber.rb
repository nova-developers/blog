require 'capybara'
require 'capybara/cucumber'
require 'capybara/rspec'

Capybara.run_server = false
Capybara.app_host = 'http://localhost:8888'
Capybara.default_driver = :selenium

After do
  Posts.down
  Users.down
end
