class UI

  def initialize(output)
    @output = output
  end

  def display_title(string)
    @output.puts "# #{string} #"
  end
  
end
