array = [10, 2, 3, 4, 5]

def Mininal_element arr
	minim=arr[0]
	for i in(0..arr.size-1)
		if (arr[i] < minim)
			minim = arr[i]
		end
	end
	return minim
end
print "Вывожу минимальный элемент массива: #{Mininal_element(array)}\n"


def Element_print arr
	print "Вывожу элементы массива:"
	for i in(0..arr.size-1)
		print "#{arr[i]}  "
	end
	print "\n"
end
Element_print(array)


def First_positive_elem arr
	for i in(0..arr.size-1)
		if (arr[i] > 0)
			return arr[i]
			break
		end
	end
end
print "Вывожу первый положительный элемент массива: #{First_positive_elem(array)}"
