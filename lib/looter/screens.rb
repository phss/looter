class Screen

  def initialize(adventure)
    @adventure = adventure
  end

  def layout
    { } 
  end

  def options
    nil
  end

  def next_screen(options)
    nil
  end

end

class IntroScreen < Screen

  def layout
    {
      :title => 'Looter',
      :subtitle => @adventure.title,
      :options => ['Start new game', 'Continue', 'Exit']
    }
  end

  def options
    [:start, :exit]
  end

  def next_screen(option)
    option == :exit ? :exit : :room
  end

end

class ExitScreen < Screen

  def layout
    { :description => "Bye!" } 
  end

end

class RoomScreen < Screen

  def layout
    room = @adventure.current_room
    {
      :title => room.name,
      :description => room.description,
      :options => room.exit_names
    }
  end

  def options
    @adventure.current_room.exit_rooms
  end

  def next_screen(room_id)
    @adventure.travel_to(room_id)
    :room
  end

end
