class Student_short

	attr_accessor :id, :second_name_and_initials, :git, :contact

	def initialize(id: , second_name_and_initials: , git: , contact: )
		self.id = id
		self.second_name_and_initials = second_name_and_initials
		self.git = git
		self.contact = contact
	end

	def Student_short.string_parsing(str)
		if str.empty? || str.nil?
			raise ArgumentError.new("Строка пуста!")
		end
		student_atribute = {}
		str.split(';').each do |pars_str|
			key, val = pars_str.split(':').map(&:strip)
			case key.downcase
				when 'id'
					student_atribute[:id] = val
				when 'second_name_and_initials'
					student_atribute[:second_name_and_initials] = val
				when 'git'
					student_atribute[:git] = val
				when 'contact'
					student_atribute[:contact] = val
			end
		end
		return student_atribute
	end

	def get_info
		print ("ФИО:#{second_name_and_initials}; Git:#{git}; Контакт:#{contact}; \n \n")
	end

	def Student_short.create_from_pars_string(str)
		pars_str = Student_short.string_parsing(str)
		Student_short.new(**pars_str)
	end


	def to_s
		"ФИО студента:#{self.second_name_and_initials}\n  ID студента:#{self.id}\n  Контакт студента:#{self.contact}\n  Гит студента:#{self.git}\n\n\n"
	end
end