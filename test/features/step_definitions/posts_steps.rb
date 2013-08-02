Given "there are posts" do
  Posts.up
end

Then "I should see those posts" do
  page.should have_content('A Fishful of Dollars')
  Posts.down
end
