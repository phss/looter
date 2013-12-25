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
    @template = SingleValueTemplate.new(pattern)
  end

  def apply(values)
    values.map { |value| @template.apply(value) }.join("\n")
  end

end
