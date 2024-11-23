class Tags
  attr_accessor :name, :values, :atribute, :childs

  def initialize(name, values, atribute=nil)
    self.name = name
    self.values = values
    self.atribute = atribute
    self.childs = []
  end

  def add_child(child)
    self.childs << child
  end

  def tag_name_and_atribute
    "#{self.name}#{self.atribute}"
  end

  def has_values?
    !self.values.empty?
  end

  def childs_count
    self.childs.size
  end
end

