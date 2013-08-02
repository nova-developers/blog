USER = {
  email: "homer@example.com",
  full_name: "Homer J. Simpson",
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
  click_button "Sign In"
end

Then "I see that user info in the session" do
  within(".session") do
    page.should have_content(USER[:full_name])
    page.should have_link("Sign Out")
  end
end

Given "I am signed in" do
  step %{there is a user "johnny@example.com"}
  step %{I am on the home page}
  step %{I follow "Sign In"}
  step %{I submit valid credentials}
end
