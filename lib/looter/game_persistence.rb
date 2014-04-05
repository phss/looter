
class GamePersistence

  def initialize(save_dir, game_filename)
    @save_dir = save_dir
    @game_filename = game_filename
  end

  def save(adventure)
    save_contents = {
      'current_room' => adventure.current_room.id.to_s
    }
    File.open(save_file, 'w') { |f| YAML.dump(save_contents, f) }
  end

  def load(adventure)
    save_contents = YAML.load_file(@save_filename)

    adventure.travel_to(save_contents['current_room'])
  end

 private

  def save_file
    File.join(@save_dir, @game_filename)
  end

end
