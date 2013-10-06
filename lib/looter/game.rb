class Game

  def initialize(ui, title)
    @ui, @title = ui, title
  end

  def play
    @ui.display_title(@title)
  end
  
end
