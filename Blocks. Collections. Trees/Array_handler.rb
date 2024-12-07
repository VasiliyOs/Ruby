class Array_handler
  attr_accessor :array

  def initialize(array)
    self.array = array
  end

  private :array=,:array

  def find_all
    new_arr = []
    array.each do |elem|
      if yield(elem)
        new_arr.push(elem)
      end
    end
    new_arr
  end

  def min
    minim = array[0]
    array.each do |elem|
      if elem<minim
        minim=elem
      end
    end
    minim
  end

  def max
    maxim = array[0]
    array.each do |elem|
      if elem>maxim
        maxim=elem
      end
    end
    maxim
  end

  def min_max
    [array.min, array.max]
  end

  def reduce(accum = 0)
    array.each do |elem|
      accum = yield(elem,accum)
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

  def none?
    flag = true
    if !block_given?
      flag=true
    else
      array.each do |elem|
        if yield(elem)
          flag=false
        end
      end
    end
    flag
  end

  def any?
    flag = false
    if !block_given?
      flag=true
    else
      array.each do |elem|
        if yield(elem)
          flag=true
        end
      end
    end
    flag
  end

  def to_s
    array
  end
end
arr_handler = Array_handler.new([1,7,3,5,9])
p arr_handler.find_all{|elem| elem%2==0}
p arr_handler.min_max
p arr_handler.reduce(10){|elem,accum| accum+elem*2}
p arr_handler.find_index{|elem| elem%2==0}
p arr_handler.any?{|elem| elem%5==0}
p arr_handler.none?{|elem| elem%2==0}
