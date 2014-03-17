
class AdventureSaver

  def initialize(save_filename)
    @save_filename = save_filename
  end

  def save(adventure)
    save_contents = {
      'current_room' => adventure.current_room.id
    }
    File.open(@save_filename, 'w') { |f| YAML.dump(save_contents, f) }
  end

end
