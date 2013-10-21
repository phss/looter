class GameProcess
  TITLE_REGEXP = /^# (.*) #/
  SUBTITLE_REGEXP = /^- (.*) -/
  OPTION_REGEXP = /^\d- (.*)/

  def initialize(game_command)
    @process_input = IO.popen("#{game_command} > game_output.log", 'w')
    @process_output = File.open('game_output.log', 'r')
    @raw_lines = @process_output.readlines.map(&:chomp)
  end

  def read_title
    read_lines_matching(TITLE_REGEXP).first
  end

  def read_subtitle
    read_lines_matching(SUBTITLE_REGEXP).first
  end

  def read_options
    read_lines_matching(OPTION_REGEXP)
  end

  def choose_option(option)
    option_number = read_options.index(option)
    write(option_number)
  end

 private

  def read_lines_matching(regexp)
    matching_lines = output_lines.select { |line| regexp.match(line) }
    return matching_lines.map { |line| regexp.match(line)[1] }
  end

  def output_lines
    @raw_lines
  end

  def write(output)
    @process_input.puts(output)
  end
end
