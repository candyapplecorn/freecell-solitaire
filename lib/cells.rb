require_relative 'card'

class Cell < Array
  def push(card)
    return false unless accepts?(card)
    super
  end

  def accepts?(card)
    raise "not implemented"
  end
end

class FreeCell < Cell
  def accepts?(card)
    empty?
  end
end

class Tableau < Cell
  def accepts?(card)
    return true if count == 0 || last < card
  end
end

class Foundation < Cell
  def accepts?(card)
    return true if empty?
    return !card.same_color(last) && card > last
  end
end
