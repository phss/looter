class SingleValueTemplate

  def initialize(template)
    @template = template
  end

  def apply(string)
    @template % string
  end


end
