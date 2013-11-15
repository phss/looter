class UI

  def initialize(input, output)
    @input = input
    @output = output
  end

  def display_screen(options)
    display_title(options[:title])
    display_subtitle(options[:subtitle])
    display_options(options[:options])
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
  
  def display_title(string)
    display_message "# #{string} #"
  end
  
  def display_subtitle(string)
    display_message "- #{string} -"
  end

  def display_options(options)
    options.each_with_index do |option, index|
      display_message "#{index+1}- #{option}"
    end
  end

  def read
    @input.gets
  end

end
