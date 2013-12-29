require 'pty'

class GameProcess
  TITLE_REGEXP = /^# (.*) #/
  SUBTITLE_REGEXP = /^- (.*) -/
  DESCRIPTION_REGEXP = /^(.*)/
  OPTION_REGEXP = /^\d- (.*)/

  def initialize(game_command)
    @process = ShellProcess.new(game_command)
    @raw_lines = []
    update_raw_output
  end

  def read_title
    read_lines_matching(TITLE_REGEXP).last
  end

  def read_subtitle
    read_lines_matching(SUBTITLE_REGEXP).last
  end
  
  def read_description
    read_lines_matching(DESCRIPTION_REGEXP)[1] # For now, it's the second line
  end

  def read_options
    read_lines_matching(OPTION_REGEXP)
  end

  def choose_option(option)
    option_number = read_options.index(option) + 1
    write(option_number)
    update_raw_output
  end

  def write(output)
    @process.write(output)
  end

  def read_last_message
    output_lines.last
  end

 private

  def update_raw_output
    @raw_lines = @process.read_all_available
  end

  def read_lines_matching(regexp)
    matching_lines = output_lines.select { |line| regexp.match(line) }
    return matching_lines.map { |line| regexp.match(line)[1] }
  end

  def output_lines
    @raw_lines
  end

end


class ShellProcess
  def initialize(command)
    @master, slave = PTY.open
    read, @write = IO.pipe

    spawn(command, :in=>read, :out=>slave)
    slave.close
    read.close
  end

  def write(string)
    @write.puts(string)
  end

  def read_all_available
    output = []
    retries = 0

    begin
      while true
        output += @master.read_nonblock(100000).split("\n").map(&:chomp)
        retries = 0
      end
    rescue
      retries += 1
      retry if output.empty? || retries < 1000
    end

    return output    
  end
end
