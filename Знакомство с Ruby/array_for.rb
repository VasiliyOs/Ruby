array = [10, 2, 3, 4, 5]

def minimal_element arr
	minim=arr[0]
	for i in(0..arr.size-1)
		if (arr[i] < minim)
			minim = arr[i]
		end
	end
	return minim
end
print "Вывожу минимальный элемент массива: #{minimal_element(array)}\n"


def elements_print arr
	print "Вывожу элементы массива:"
	for i in(0..arr.size-1)
		print "#{arr[i]}  "
	end
	print "\n"
end
elements_print(array)


def first_positive_elem arr
	for i in(0..arr.size-1)
		if (arr[i] > 0)
			return arr[i]
			break
		end
	end
end
print "Вывожу первый положительный элемент массива: #{first_positive_elem(array)}"
