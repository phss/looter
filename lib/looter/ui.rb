class UI

  def initialize(output)
    @output = output
  end

  def display_title(string)
    @output.puts "# #{string} #"
  end
  
  def display_subtitle(string)
    @output.puts "- #{string} -"
  end
  
end
