array = [-10, 5, 3, 4, 0]

def Mininal_element arr
	minim=arr[0]
	i=0
	while (arr[i] != nil)
		if arr[i]<minim
			minim=arr[i]
		end
		i+=1
	end
	return minim
end
print "Вывожу минимальный элемент массива: #{Mininal_element(array)}\n"


def Element_print arr
	i=0
	print "Вывожу элементы массива:"
	while (arr[i] != nil)
		print "#{arr[i]}  "
		i+=1
	end
	print "\n"
end
Element_print(array)


def First_positive_elem arr
	i=0
	while (arr[i] != nil)
		if (arr[i] > 0)
			return arr[i]
			break
		end
		i+=1
	end
end
print "Вывожу первый положительный элемент массива: #{First_positive_elem(array)}"
