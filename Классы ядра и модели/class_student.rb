class Student
	attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :git
	def initialize(first_name,second_name,third_name,id = nil,telephone = nil,telegram = nil,git = nil)
		self.id = id
		self.first_name = first_name
		self.second_name = second_name
		self.third_name = third_name
		self.telephone = telephone
		self.telegram = telegram
		self.git = git
	end
	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n Телефон студента:#{self.telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n"
	end
end
