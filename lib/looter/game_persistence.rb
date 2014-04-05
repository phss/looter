
class GamePersistence

  def initialize(game_dir, save_dir, game_filename)
    @game_dir = game_dir
    @save_dir = save_dir
    @game_filename = game_filename
  end

  def new_adventure
    load_adventure_with({})
  end

  def load
    state_hash = YAML.load_file(save_file)

    load_adventure_with(state_hash)
  end

  def save(adventure)
    save_contents = {
      'current_room' => adventure.current_room.id.to_s
    }
    File.open(save_file, 'w') { |f| YAML.dump(save_contents, f) }
  end

 private

  def save_file
    File.join(@save_dir, @game_filename)
  end

  def game_file
    File.join(@game_dir, @game_filename)
  end

  def load_adventure_with(state_hash)
    adventure_hash = YAML.load_file(game_file)

    AdventureLoader.load_from_hash(adventure_hash, state_hash)
  end

end
