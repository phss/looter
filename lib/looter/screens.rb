class IntroScreen

  def initialize(adventure)
    @adventure = adventure
  end

  def layout
    {
      :title => 'Looter',
      :subtitle => @adventure.title,
      :options => ['Start new game', 'Exit']
    }
  end

  def options
    [:start, :exit]
  end

  def next_screen(option)
    option == :exit ? :exit : :room
  end

end

class ExitScreen

  def initialize(adventure)
  end

  def layout
    { :description => "Bye!" } 
  end

  def options
    nil
  end

  def next_screen(options)
    nil
  end
end

class RoomScreen
  
  def initialize(adventure)
    @adventure = adventure
  end

  def layout
    room = @adventure.next_room
    {
      :title => room.name,
      :description => room.description,
      :options => room.exit_names
    }
  end

  def options
    nil
  end

  def next_screen(option)
    :exit
  end

end
