Given(/^I go to the main page$/) do
  visit '/' 
end

When(/^I start a game$/) do
  click_link 'Start Game'
end

Then(/^I have the question "(.*?)"$/) do |question|
  find('.question').should have_content(question)
end
