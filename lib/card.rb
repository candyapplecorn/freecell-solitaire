class Card
  attr_accessor :suite, :face, :svalue, :fvalue

  FACES = %i{ace two three four five six seven eight nine ten jack queen king}
  SUITES = %i{spades clubs diamonds hearts}

  def initialize(suite, value)
    @svalue = suite
    @fvalue = value
    @suite = SUITES[suite]
    @face = FACES[value]
  end

  def same_color(other)
    return [other.suite, @suite].all? {|s| SUITES.slice(0, 2).include?(s) } ||
           [other.suite, @suite].all? {|s| SUITES.slice(2, 2).include?(s) }
  end

  def >(other)
    is_after?(other)
  end

  def <(other)
    !self.>(other)
  end

  def is_after?(other)
    other.fvalue == @fvalue - 1
  end

  def is_before?(other)
    other.fvalue == @fvalue + 1
  end
end
