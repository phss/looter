
class GamePersistence

  def initialize(game_dir, save_dir, game_filename)
    @game_dir = game_dir
    @save_dir = save_dir
    @game_filename = game_filename
  end

  def new_adventure
    adventure_raw = YAML.load_file(game_file)

    AdventureLoader.load_from_hash(adventure_raw)
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

  def game_file
    File.join(@game_dir, @game_filename)
  end

end
