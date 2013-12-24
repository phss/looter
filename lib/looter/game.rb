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
    if option == :exit
      @ui.display_message("Bye!")
      return
    end

    room = adventure.next_room
    @ui.display_screen(:title => room.name)
  end

end
