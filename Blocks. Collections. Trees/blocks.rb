def backwards_elem(array)
  new_arr = array.dup
  min_index = array.index(array.min)
  max_index = array.index(array.max)
  if min_index > max_index
    max_index, min_index = min_index, max_index
  end
  new_arr[min_index+1..max_index-1]=new_arr[min_index+1..max_index-1].reverse
  new_arr
end

def find_2_max_elem(array)
  numbers = array.sort
  numbers.last(2)
end

def find_max_odd(array)
  odd_numbers = array.select {|num| num.odd?}
  max_odds = odd_numbers.sort
  max_odds.last(1)
end

def find_most_frequent_elem_indexes(arr)
  most_frequent_element = arr.max_by{|element| arr.select {|x| x == element}.size}
  indexes = (0...arr.size).select {|index| arr[index] == most_frequent_element}
end

def find_el_del_on_self_index(arr)
  indexes = (0...arr.size).select{|index| arr[index] % (index+1)==0 and arr.count(arr[index])==1}
  arr.values_at(*indexes)
end

def input_arr
  puts "Введите целочисленный массив:"
  array = gets.chomp.split.map(&:to_i)
end


def from_file_arr(file_path)
  array = []
  if file_path.nil? || file_path.empty? || not(File.exist?(file_path))
    puts 'Путь к файлу не должен быть пустым или файла не существует!'
  else
    File.open(file_path, 'r') do |file|
      array = file.read.split.map(&:to_i)
    end
  end
  array
end


puts "Введите задание от 1 до 5, для отмены введите 0:"
choice_task = gets.to_i
puts "Введите тип воода (1-с клавиатуры, 2-из файла):"
choice_input = gets.to_i
if choice_input == 1
  arr = input_arr
elsif choice_input == 2
  puts "Введите путь к файлу:"
  file_path = gets.chomp
  arr = from_file_arr(file_path)
end

def do_task(choice_task,arr)
  if not(arr.empty?)
    case choice_task
    when 1
      p "Массив с элементами наоборот между максимальным и минимальным:#{backwards_elem(arr)}"
    when 2
      p "2 максимальных элемента массива:#{find_2_max_elem(arr)}"
    when 3
      puts "Максимальный нечётный элемент:#{find_max_odd(arr)}"
    when 4
      p "Индексы элемента, который чаще всего встречается:#{find_most_frequent_elem_indexes(arr).inspect}"
    when 5
      p "Элементы, который делятся на свой номер и встречаются 1 раз:#{find_el_del_on_self_index(arr)}"
    when 0
      puts "Выбор задачи отменён!"
    else
      puts "Неверный выбор номера задачи!"
    end
  else
    puts "Массив пуст!"
  end
end
do_task(choice_task,arr)
