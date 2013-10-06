class Game

  def initialize(ui)
    @ui = ui
  end

  def play(adventure)
    @ui.display_title('Looter')
    @ui.display_subtitle(adventure.title)
  end
  
end
