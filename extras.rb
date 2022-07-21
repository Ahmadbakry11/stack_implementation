require_relative 'stack'

class Extras < Stack 
  def initialize(max_size)
    super
  end

  def mean
    avg
  end
end
