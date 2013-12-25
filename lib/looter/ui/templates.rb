class SingleValueTemplate

  def initialize(pattern)
    @pattern = pattern
  end

  def apply(value)
    @pattern % value
  end

end

class ListTemplate

  def initialize(pattern)
    @template = SingleValueTemplate.new("%s" + pattern)
  end

  def apply(values)
    values.each_with_index.map do |value, index| 
      @template.apply([index + 1, value])
    end.join("\n")
  end

end
