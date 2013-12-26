require_relative 'ui/templates'

class UI
  TEMPLATES = {
    :title => SingleValueTemplate.new("# %s #"),
    :subtitle => SingleValueTemplate.new("- %s -"),
    :description => SingleValueTemplate.new("%s"),
    :options => ListTemplate.new("- %s")
  }

  def initialize(input, output)
    @input = input
    @output = output
  end

  def display_screen(options)
    options.each do |option, value|
      display_message TEMPLATES[option].apply(value)
    end
  end

  def choose_option(options)
    selected_option_index = read.to_i - 1
    return nil if selected_option_index < 0
    return options[selected_option_index]
  end

  def display_message(string)
    @output.puts string
  end

 private

  def read
    @input.gets
  end

end
