class Game

  def initialize(ui)
    @ui = ui
  end

  def play(adventure)
    @ui.display_title('Looter')
    @ui.display_subtitle(adventure.title)
    @ui.choose_option(['Start new game', 'Exit'])
    @ui.display_message("What's your name, adventurer?")
  end
  
end
