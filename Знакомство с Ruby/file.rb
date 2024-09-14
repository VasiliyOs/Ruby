def mininal_element arr
	minim=arr[0]
	for i in(0..arr.size-1)
		if (arr[i] < minim)
			minim = arr[i]
		end
	end
	return minim
end


def elements_print arr
	for i in(0..arr.size-1)
		print "#{arr[i]}  "
	end
	print "\n"
end


def first_positive_elem arr
	for i in(0..arr.size-1)
		if (arr[i] > 0)
			return arr[i]
			break
		end
	end
end


file_name = ARGV[0] + ".txt"
def arr_from_file file_name
	if File.exist? (file_name)
		file_arr = File.open(file_name)
		arr = file_arr.read
	end
	return arr
end


massive = arr_from_file(file_name).split
print massive

method_name = ARGV[1]
case method_name
	when 'minimal_element'
		print "Минимальный элемент в файле: #{mininal_element(massive)}\n"
	when 'elements_print'
		print "Вывод массива из файла:#{elements_print(massive)}\n"
	when "first_positive_elem"
		print "Первый положительный элемент в файле: #{first_positive_elem(massive)}\n"
end
