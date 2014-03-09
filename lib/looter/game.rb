class Game

  def initialize(ui)
    @ui = ui
    @screens = {
      :intro => IntroScreen.new(ui),
      :room => RoomScreen.new(ui)
    }
    @current_screen = :intro
  end

  def play(adventure)
    while @current_screen
      screen = @screens[@current_screen]
      screen.show(adventure)
      @current_screen = screen.next_screen
    end
  end

end

class IntroScreen

  def initialize(ui)
    @ui = ui
  end

  def show(adventure)
    @ui.display_screen(
      :title => 'Looter',
      :subtitle => adventure.title,
      :options => ['Start new game', 'Exit'])
  end

  def next_screen
    option = @ui.choose_option([:start, :exit])

    if option == :exit
      @ui.display_screen(:description => "Bye!")
      return nil
    end

    return :room
  end

end

class RoomScreen
  
  def initialize(ui)
    @ui = ui
  end

  def show(adventure)
    @ui.display_screen(
      :title => adventure.next_room.name,
      :description => adventure.next_room.description,
      :options => adventure.next_room.exit_names)
  end

  def next_screen
    nil
  end

end
