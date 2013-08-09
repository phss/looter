Given(/^I go to the main page$/) do
  visit '/' 
end

When(/^I start a game$/) do
  click_button 'Start Game'
end

Then(/^I have the question "(.*?)"$/) do |question|
  pending
end
