USER = {
  email: "homer@example.com",
  full_name: "Home J. Simpson",
  password: "password",
  bio: "Oh, everything looks bad if you remember it."
}

Given /there is a user "(.*?)"$/ do |email|
  @email = email
  Users.up USER.merge({email: @email})
end

When "I submit valid credentials" do
  fill_in :email, with: @email
  fill_in :password, with: USER[:password]
end

Then "I should be on that user profile page" do
  page.should have_content
end
