class Game

  def initialize(ui)
    @ui = ui
  end

  def play(adventure)
    option = main_menu_for(adventure)

    if option == :exit
      @ui.display_screen(:description => "Bye!")
      return
    end

    @ui.display_screen(
      :title => adventure.next_room.name,
      :description => adventure.next_room.description,
      :options => adventure.next_room.exits)
  end

 private

  def main_menu_for(adventure)
    @ui.display_screen(
      :title => 'Looter',
      :subtitle => adventure.title,
      :options => ['Start new game', 'Exit'])

    @ui.choose_option([:start, :exit])
  end

end
