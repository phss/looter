When(/^I start the game$/) do
  @game = Game.new(IO.popen('./bin/game'))
end

Then(/^I should see the options$/) do |table|
  expected_options = as_list(table)
  actual_options = @game.read_options

  actual_options.should =~ expected_options
end

def as_list(table)
  table.raw.map(&:first)
end

class Game
  def initialize(process)
    @process = process
  end

  def read_options
    @process.readlines.map(&:chomp)
  end
end
