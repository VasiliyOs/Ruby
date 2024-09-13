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
