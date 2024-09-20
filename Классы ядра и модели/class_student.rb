class Student
	def check_telephone?(phone_number)
  		phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
  		!!(phone_number =~ phone_regex)
	end
	attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	def initialize(info = {})
		self.id = info[:id] || nil
		self.first_name = info[:first_name]
		self.second_name = info[:second_name]
		self.third_name = info[:third_name]
		if (check_telephone?(info[:telephone]) == true)
			self.telephone = info[:telephone]
		else
			self.telephone = nil
		end
		self.telegram = info[:telegram] || nil
		self.git = info[:git] || nil
	end
	def print_student
		print ("Имя студента:#{self.first_name}\n")
		print ("Фамилия студента:#{self.second_name}\n")
		print ("Отчество студента:#{self.third_name}\n")
		print ("ID студента:#{self.id}\n")
		print ("Телефон студента:#{self.telephone}\n")
		print ("Телеграм студента:#{self.telegram}\n")
		print ("Гит студента:#{self.git}\n")
		print ("\n\n")
	end
end
