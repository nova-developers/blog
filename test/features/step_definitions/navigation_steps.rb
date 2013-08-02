When "I am on the home page" do
  visit '/'
end

When /I follow "(.*?)"$/ do |link_text|
  click_link link_text
end
