def backwards_elem(array)
  new_arr = array.dup
  min_index = array.index(array.min)
  max_index = array.index(array.max)
  if min_index > max_index
    max_index, min_index = min_index, max_index
  end
  yield(min_index,max_index,new_arr)
  new_arr
end

def find_2_max_elem(array)
  numbers = array.sort
  yield(numbers)
end

def find_max_odd(array)
  odd_numbers = array.select {|num| num.odd?}
  max_odds = odd_numbers.sort
  yield(max_odds)
end

def find_most_frequent_elem_indexes(arr)
  max_count = 0
  max_el = nil
  arr.each do |el|
    count = arr.count(el)
    if yield(max_count,count)
      max_count = count
      max_el = el
    end
  end
  indices = arr.each_index.select {|index| arr[index] == max_el}
end
