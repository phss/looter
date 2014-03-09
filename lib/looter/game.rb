class Game

  def initialize(ui)
    @ui = ui
    @screens = {
      :intro => IntroScreen,
      :room => RoomScreen,
      :exit => ExitScreen
    }
    @current_screen = :intro
  end

  def play(adventure)
    while still_playing
      screen = load_current_screen(adventure)
      show(screen)
      act(screen)
    end
  end

 private

  def still_playing
    @current_screen
  end

  def load_current_screen(adventure)
    @screens[@current_screen].new(adventure)
  end

  def show(screen)
    @ui.display_screen(screen.layout)
  end

  def act(screen)
    if screen.options
      selected_option = @ui.choose_option(screen.options)
    end
    @current_screen = screen.next_screen(selected_option)
  end

end

