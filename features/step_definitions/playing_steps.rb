When(/^I start the game "(.*?)"$/) do |game_file|
  @game_process = GameProcess.new("./bin/game games/#{game_file}")
end

Then(/^I should see game title "(.*?)"$/) do |expected_title|
  actual_title = @game_process.read_title

  actual_title.should == expected_title
end

Then(/^I should see aventure title "(.*?)"$/) do |expected_title|
  actual_title = @game_process.read_subtitle

  actual_title.should == expected_title
end

Then(/^I should see the options$/) do |table|
  expected_options = as_list(table)
  actual_options = @game_process.read_options

  actual_options.should =~ expected_options
end

When(/^I choose "(.*?)"$/) do |option|
  @game_process.choose_option(option)
end

Then(/^I should see question "(.*?)"$/) do |expected_question|
  actual_question = @game_process.read_last_message

  actual_question.should == expected_question
end

When(/^I answer "(.*?)"$/) do |answer|
  @game_process.write(answer)
end

Then(/^I should be in room "(.*?)"$/) do |expected_room_name|
  actual_room_name = @game_process.read_title

  actual_room_name.should == expected_room_name
end

Then(/^I should read description "(.*?)"$/) do |expected_description|
  pending
end

def as_list(table)
  table.raw.map(&:first)
end

