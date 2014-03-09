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
    while @current_screen
      screen = @screens[@current_screen].new(adventure)
      @ui.display_screen(screen.layout)
      if screen.options
        selected_option = @ui.choose_option(screen.options)
      end
      @current_screen = screen.next_screen(selected_option)
    end
  end

end

