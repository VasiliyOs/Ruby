class Data_list
  attr_accessor :array

  private :array, :array=

  def initialize(array)
    self.array = array.sort
  end

  def [](ind)
    if !array[ind].nil?
      self.array[ind]
    else
      raise IndexError.new("Неверный индекс")
    end
  end
end
