class Game

  def initialize(ui)
    @ui = ui
  end

  def play(adventure)
    @ui.display_screen(
      :title => 'Looter',
      :subtitle => adventure.title,
      :options => ['Start new game', 'Exit'])

    option = @ui.choose_option([:start, :exit])
    if option == :start
      @ui.display_message("What's your name, adventurer?")
    end
  end

end
