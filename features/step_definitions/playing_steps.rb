When(/^I start a sample game$/) do
  visit '/' 
  click_link 'Start Game'
end

Then(/^I am asked the question "(.*?)"$/) do |question|
  find('.question').should have_content(question)
end

When(/^I answer "(.*?)"$/) do |answer|
  fill_in('answer', :with => answer)
  click_button('I said')
end

Then(/^I am in room "(.*?)"$/) do |title|
  find('.title').should have_content(title)
end
