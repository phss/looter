class Game

  def initialize(ui, saver, screens, start_screen)
    @ui = ui
    @saver = saver
    @screens = screens
    @current_screen = start_screen
  end

  def play(adventure)
    while still_playing
      screen = load_current_screen(adventure)
      show(screen)
      act(screen)
      save(adventure)
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

  def save(adventure)
    @saver.save(adventure)
  end

end

