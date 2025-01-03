class Data_list
  attr_accessor :array

  private :array, :array=

  def initialize(array)
    self.array = []
    array.sort.each do |elem|
      self.array << ({data: elem, select: false})
    end
  end

  def [](ind)
    if !self.array[ind].nil?
      self.array[ind]
    else
      raise IndexError.new("Неверный индекс")
    end
  end

  def select(ind)
    if !self.array[ind].nil?
      self.array[ind][:select] = true
    end
  end

  def get_selected
    selected_arr = self.array.find_all{|elem| elem[:select] == true}
  end

  def get_names

  end
  protected :get_names

  def get_data

  end
  private :get_data
end
