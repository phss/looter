class UI

  def initialize(output)
    @output = output
  end

  def display_title(string)
    display "# #{string} #"
  end
  
  def display_subtitle(string)
    display "- #{string} -"
  end

  def choose_option(options)
    options.each_with_index do |option, index|
      display "#{index+1}- #{option}"
    end
  end

 private

  def display(string)
    @output.puts string
  end
  
end
