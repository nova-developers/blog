Given "there are posts" do
  Posts.up
end

Then "I should see those posts" do
  page.should have_content('A Fishful of Dollars')
  Posts.down
end

Then "I submit the post details" do
  fill_in 'headline', with: "Great New Post"
  fill_in 'content', with: "This is a super great post. You will learn a lot from it"

  click_button "Save Draft"
end

Then "I see the post details" do
  within(".blog_post") do
    page.should have_content("Great New Post")
    page.should have_content("This is a super great post. You will learn a lot from it")
  end
end
