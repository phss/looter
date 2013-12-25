class SingleValueTemplate

  def initialize(template)
    @template = template
  end

  def apply(string)
    @template % string
  end

end

class ListTemplate

  def initialize(template)
    @template = SingleValueTemplate.new(template)
  end

  def apply(values)
    values.map { |value| @template.apply(value) }.join("\n")
  end

end
