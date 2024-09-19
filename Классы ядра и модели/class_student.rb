class Student
	attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	def id
		@id
	end
	def id=(id)
		@id = id
	end
	def first_name
		@first_name
	end
	def first_name=(first_name)
		@first_name = first_name
	end
	def second_name
		@second_name
	end
	def second_name=(second_name)
		@second_name = second_name
	end
	def third_name
		@third_name
	end
	def third_name=(third_name)
		@third_name = third_name
	end
	def telephone
		@telephone
	end
	def telephone=(telephone)
		@telephone=telephone
	end
	def telegram
		@telegram
	end
	def telegram=(telegram)
		@telegram=telegram
	end
	def git
		@git
	end
	def git=(git)
		@git=git
	end
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
