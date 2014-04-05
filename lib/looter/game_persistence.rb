
class GamePersistence

  def initialize(save_filename)
    @save_filename = save_filename
  end

  def save(adventure)
    save_contents = {
      'current_room' => adventure.current_room.id
    }
    File.open(@save_filename, 'w') { |f| YAML.dump(save_contents, f) }
  end

  def load(adventure)
    save_contents = YAML.load_file(@save_filename)

    adventure.travel_to(save_contents['current_room'])
  end

end
