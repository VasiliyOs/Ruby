class Student
	attr_reader :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	attr_writer :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	def initialize(first_name,second_name,third_name,id = nil,telephone = nil,telegram = nil,git = nil)
		self.id = id
		self.first_name = first_name
		self.second_name = second_name
		self.third_name = third_name
		self.telephone = telephone
		self.telegram = telegram
		self.git = git
	end
	def print_student
		print ("Имя студента:#{self.first_name}\n")
		print ("Фамилия студента:#{self.second_name}\n")
		print ("Отчество студента:#{self.third_name}\n")
		if (self.id == nil)
			print ("ID студента: ОТСУТСТВУЕТ\n")
		else
			print ("ID студента:#{self.id}\n")
		end
		if (self.telephone == nil)
			print ("Телефон студента: ОТСУТСТВУЕТ\n")
		else
			print ("Телефон студента:#{self.telephone}\n")
		end
		if (self.telegram == nil)
			print ("Телеграм студента: ОТСУТСТВУЕТ\n")
		else
			print ("Телеграм студента:#{self.telegram}\n")
		end
		if (self.git == nil)
			print ("Гит студента: ОТСУТСТВУЕТ\n")
		else
			print ("Гит студента:#{self.git}\n\n\n")
		end
	end
end
