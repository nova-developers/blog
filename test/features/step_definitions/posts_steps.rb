Given "there are posts" do
  Posts.up
end

When "I am on the home page" do
  visit '/'
end

Then "I should see those posts" do
  page.should have_content('A Fishful of Dollars')
  Posts.down
end