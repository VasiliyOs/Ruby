def Prost a
	flag = 1
	for i in (2..a-1)
		if (a%i==0)
			flag = 0
		end
	end
	return flag
end
def Sum_neprost_del a
	sum = 0
	for i in(2..a)
		if (a%i==0) && Prost(i)==0
			sum += i
		end
	end
	return sum
end


print ("Напишите число, сумму непростых делителей которого вы хотите узнать:")
num_neprost_del = gets.to_i
print ("Ответ: #{Sum_neprost_del(num_neprost_del)}\n")


def Sum_digits_more_3 num
	kol = 0
	while (num!=0)
		if (num%10>3)
			kol+=1
		end
		num=num/10
	end
	return kol
end


print ("Напишите число, где вы хотите узнать количество цифр, больше чем 3:")
num_kol_digits = gets.to_i
print ("Ответ: #{Sum_digits_more_3(num_kol_digits)}\n")


#В данном методе используется функция простоты из первого метода
def Vzaimn_prostota num1, num2
	minumum = [num1,num2].min	
	flag = 1
	for i in(2..minumum)
		if (num1%i==0) && (num2%i==0)
			flag = 0
		end
	end
	return flag
end
def Sum_prost_digits num
	sum = 0
	while (num!=0)
		if (Prost(num%10))
			sum+=num%10
		end
		num=num/10
	end
	return sum
end


print ("Напишите число, у которого нужно: найти количество чисел, не являющихся делителями числа, не взаимно простых с ним и взаимнопростых с суммой простых цифр числа: ")
number = gets.to_i
kol_good_numbers = 0
for i in(2..number-1)
	if (number%i != 0)
		if (Vzaimn_prostota(number,i)==0) && (Vzaimn_prostota(i,Sum_prost_digits(number))==1)
			print i
			kol_good_numbers+=1
		end
	end
end
print ("Ответ: #{kol_good_numbers}\n")
