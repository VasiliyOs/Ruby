class Student
	def check_telephone?(phone_number)
  		phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
  		!!(phone_number =~ phone_regex)
	end
	attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	def initialize(first_name, second_name, third_name, info = {})
		self.id = info[:id] 
		self.first_name = first_name
		self.second_name = second_name
		self.third_name = third_name
		if (check_telephone?(info[:telephone]) == true)
			self.telephone = info[:telephone]
		else
			self.telephone = nil
		end
		self.telegram = info[:telegram]
		self.git = info[:git]
	end
	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n Телефон студента:#{self.telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n"
	end
end
