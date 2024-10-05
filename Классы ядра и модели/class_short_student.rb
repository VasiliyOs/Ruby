require './super_class_student.rb'
class Student_short < People

	attr_accessor :name, :contact

	def initialize(id:, name:, git:, contact:)
	    initials = name.split[1].split('.')
	    second_name, first_name, third_name = name.split[0], initials[0], initials[1]
	    super(second_name: second_name, first_name: first_name, third_name: third_name, id: id, git: git)
		self.contact = contact
	end


	def Student_short.create_from_string(id:, data:)
	    student_short_init = {}

	    params = Student_short.parse_string_params(data)

	    student_short_init[:id] = id
	    student_short_init[:name] = params[0] + ' ' + params[1]
	    student_short_init[:git] = params[2]
	    student_short_init[:contact] = params[3..].join('')

	    self.new(**student_short_init)
      
  	end 
  	def self.parse_string_params(str_params)
    	return str_params.split
  	end


	def Student_short.create_from_student(stud)
		student_short_atribute = {}
		student_short_atribute[:id] = stud.get_id
		student_short_atribute[:name] = stud.get_second_name_and_initials
		student_short_atribute[:git] = stud.get_git
		student_short_atribute[:contact] = stud.get_contact

		return student_short_atribute
	end


	def get_info
		print ("ФИО:#{name}; Git:#{git}; Контакт:#{contact}; \n \n")
	end


	def to_s
		"ФИО студента:#{self.name}\n  ID студента:#{self.id}\n  Контакт студента:#{self.contact}\n  Гит студента:#{self.git}\n\n\n"
	end
end
