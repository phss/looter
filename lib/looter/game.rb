class Game

  def initialize(ui)
    @ui = ui
  end

  def play(adventure)
    @ui.display_title('Looter')
    @ui.display_subtitle(adventure.title)
    option = @ui.choose_option(['Start new game', 'Exit'])
    if option == 0
      @ui.display_message("What's your name, adventurer?")
    end
  end
  
end
