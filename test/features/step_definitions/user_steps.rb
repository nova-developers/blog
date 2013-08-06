USER = {
  email: "homer@example.com",
  full_name: "Homer J. Simpson",
  password: "password",
  twitter: "_homer_j",
  gravatar: "http://www.gravatar.com/avatar/189d9988ac98f92946dad4e90cb98a89.png",
  bio: "Oh, everything looks bad if you remember it."
}

EDIT_USER = {
  email: "sideshowbob@example.com",
  full_name: "Robert Terwilliger",
  password: "password",
  twitter: "_sideshow_bob",
  gravatar: "http://2.gravatar.com/userimage/31549881/c64c23cc9143b746aafb6bafb1057277",
  bio: "Robert Underdunk Terwilliger, better known by his stage name Sideshow Bob, is a recurring character in the animated television series The Simpsons. He is voiced by Kelsey Grammer and first appeared briefly in the episode \"The Telltale Head\"."
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

When "I submit invalid credentials" do
  fill_in :email, with: "anything@nothing.org"
  fill_in :password, with: "bogus"
  click_button "Sign In"
end

Then "I see an authentication error" do
  page.should have_content("Unable to authenticate. Please try again")
end

Then "I see that user info in the session" do
  within(".session") do
    page.should have_content(USER[:full_name])
    page.should have_link("Sign Out")
  end
end

Then "I am on the show page" do
  current_url.should match(/\/user\/\d+$/)
end

Then "I am on the view profile page" do
  current_url.should match(/\/user\/\d+\/profile$/)
end

Given "I am signed in" do
  step %{there is a user "johnny@example.com"}
  step %{I am on the home page}
  step %{I follow "Sign In"}
  step %{I submit valid credentials}
end

When "I update the user profile information" do
  fill_in :full_name, with: EDIT_USER[:full_name]
  fill_in :twitter, with: EDIT_USER[:twitter]
  fill_in :gravatar, with: EDIT_USER[:gravatar]
  fill_in :email, with: EDIT_USER[:email]
  fill_in :password, with: USER[:password]
  fill_in :confirm, with: USER[:password]

  fill_in :bio, with: EDIT_USER[:bio]

  click_button "Save"
end

Then "I see the updated profile" do
  within(".user") do
    page.should have_content(EDIT_USER[:full_name])
    page.should have_xpath("//img[@src='#{EDIT_USER[:gravatar]}']")
    page.should have_content(EDIT_USER[:bio])
  end
end

Then "I see my profile" do
  within(".author") do
    page.should have_content(USER[:full_name])
    page.should have_xpath("//img[@src='#{USER[:gravatar]}']")
    page.should have_content(USER[:bio])

    within(".social") do
      page.should have_link("Twitter", href: "http://www.twitter.com/#{USER[:twitter]}")
      page.should have_link("Email", href: "mailto:johnny@example.com")
    end
  end
end
