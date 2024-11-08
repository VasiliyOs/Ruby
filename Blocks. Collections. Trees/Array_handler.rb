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

  def min_max
    [array.min, array.max]
  end

  def reduce(first_index = 0)
    accum = []
    array[first_index..-1].each do |elem|
      accum.push(yield(elem,first_index))
    end
    accum
  end

  def find_index
    array.each_with_index do |elem,index|
      if yield(elem)
        return index
      end
    end
  end

  def any?
    flag = false
    array.each do |elem|
      if yield(elem)
        flag=true
      end
    end
    flag
  end
end

