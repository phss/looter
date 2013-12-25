require_relative 'ui/templates'

class UI
  TEMPLATES = {
    :title => SingleValueTemplate.new("# %s #"),
    :subtitle => SingleValueTemplate.new("- %s -")
  }

  def initialize(input, output)
    @input = input
    @output = output
  end

  def display_screen(options)
    options.each do |option, value|
      if option == :options
        display_options(value)
      else
        display_message TEMPLATES[option].apply(value)
      end
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

  def display_options(options)
    options.each_with_index do |option, index|
      display_message "#{index+1}- #{option}"
    end
  end

  def display(string, template)
    display_message template % string
  end

  def read
    @input.gets
  end

end
