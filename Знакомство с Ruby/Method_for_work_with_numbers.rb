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