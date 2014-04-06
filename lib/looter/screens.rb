class Screen

  def initialize(context)
    @adventure = context[:adventure]
  end

  def layout
    { } 
  end

  def options
    nil
  end

  def action_for(options)
    ScreenResult.new(nil)
  end

end

ScreenResult = Struct.new(:next_screen) do
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
    [:start, :continue, :exit]
  end

  def action_for(option)
    next_screen = option == :exit ? :exit : :room

    ScreenResult.new(next_screen)
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

  def action_for(room_id)
    @adventure.travel_to(room_id)
    ScreenResult.new(:room)
  end

end
