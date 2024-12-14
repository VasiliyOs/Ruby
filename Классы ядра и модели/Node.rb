class Node
  include Comparable
  attr_accessor :lefter, :righter, :value
  def initialize(lefter: nil, righter: nil, value:)
    self.lefter = lefter
    self.righter = righter
    self.value = value
  end

  def <=>(other)
    self.value <=> other.value
  end

  def each(&block)
    yield self
    if lefter
      lefter.each(&block)
    end
    if righter
      righter.each(&block)
    end
  end

  def to_s
    self.value.to_s
  end
end

