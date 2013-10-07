class UI

  # TODO clean this up

  def initialize(output)
    @output = output
  end

  def display_title(string)
    @output.puts "# #{string} #"
  end
  
  def display_subtitle(string)
    @output.puts "- #{string} -"
  end

  def choose_option(options)
    options.each_with_index do |option, index|
      @output.puts "#{index+1}- #{option}"
    end
  end
  
end
