When(/^I start the game$/) do
  @game_process = IO.popen('./bin/game')
end

Then(/^I should see the options$/) do |table|
  expected_options = table.raw.map(&:first)
  actual_options = @game_process.readlines.map(&:chomp)

  actual_options.should =~ expected_options
end
