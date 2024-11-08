class Array_handler
  attr_accessor :array

  def initialize(array)
    self.array = array
  end

  def find_all
    new_arr = []
    array.each do |elem|
      if yield(elem)
        new_arr.push(elem)
      end
    end
    new_arr
  end
end

