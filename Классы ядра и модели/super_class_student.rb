class People

	attr_accessor :id
	attr_reader :first_name, :second_name, :third_name, :git



	def initialize(first_name:, second_name:, third_name:, id:, git: )
	    self.first_name = first_name
	    self.second_name = second_name
	    self.third_name = third_name
	    self.id = id
	    self.git = git
  	end



	def People.check_id?(id)
		id_regex = /\A\d+\z/
		return true if id.nil?
		id = id.to_s
		(id =~ id_regex)
	end
	def People.check_first_name?(first_name)
		fname_regex = /^[A-Za-zА-Яа-яЁё]{1,}$/
		return true if first_name.nil?
		first_name =~ fname_regex
	end
	def People.check_second_name?(second_name)
		sname_regex = /^[A-Za-zА-Яа-яЁё]{1,}$/
		return true if second_name.nil?	
		second_name =~ sname_regex
	end
	def People.check_third_name?(third_name)
		tname_regex = /^[A-Za-zА-Яа-яЁё]{1,}$/
		return true if third_name.nil?
		third_name =~ tname_regex
	end
	def People.check_telephone?(phone_number)
		phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
		return true if phone_number.nil?
		phone_number =~ phone_regex
	end
	def People.check_github?(git)
		github_regex = /^(?![-_.])([a-zA-Z0-9._-]{1,39})(?<![-_.])$/
		return true if git.nil?
		git =~ github_regex
	end
	def People.check_telegram?(telegram)
		telegram_regex = /^@[a-zA-Z0-9._]{5,32}$/
		return true if telegram.nil?
		telegram =~ telegram_regex
	end
	def People.check_mail?(email)
		email_regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
		return true if email.nil?
		email =~ email_regex
	end




	def first_name=(first_name)
		if People.check_first_name?(first_name)
			@first_name = first_name
		else
			raise ArgumentError.new("Указано неправильное имя пользователя!")
		end
	end
	def second_name=(second_name)
		if People.check_second_name?(second_name)
			@second_name = second_name
		else
			raise ArgumentError.new("Указана неправильная фамилия пользователя!")
		end
	end
	def third_name=(third_name)
		if People.check_third_name?(third_name)
			@third_name = third_name
		else
			raise ArgumentError.new("Указано неправильное отчество пользователя!")
		end
	end
	def id=(id)
		if People.check_id?(id)
			@id = id
		else
			raise ArgumentError.new("Указано неправильное ID пользователя!")
		end
	end
	def git=(git)
		if People.check_github?(git)
			@git = git
		else
			raise ArgumentError.new("Указан неправильный Git пользователя!")
		end
	end


	def get_id
		if (People.check_id?(id))
			return id
		end
	end

	def has_git
		@git != nil || not(@git.empty?)
	end


	def get_second_name_and_initials
		second_name = self.second_name
		initials = self.first_name[0] + '.' + self.third_name[0] + '.'
		return "ФИО: #{second_name}" + "  " + "#{initials}"
	end

	

	def get_git
		if (self.has_git)
			return "Git: #{self.git}"
		else
			raise "У студента нет гита!"
		end


		public :has_git, :get_second_name_and_initials, :get_git
	end


	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n  Гит студента:#{self.git}\n\n\n"
	end
end





class Student < People

	attr_reader :telegram, :email, :telephone

	def initialize(first_name: , second_name: , third_name:, id:nil, email:nil, telephone: nil, git: nil, telegram: nil)
		super(first_name: first_name, second_name: second_name, third_name: third_name, id: id, git: git)
		set_contacts(telegram, telephone, email)
	end



	def email=(email)
		if Student.check_mail?(email)
			@email = email
		else
			raise ArgumentError.new("Указано неправильный E-mail пользователя!")
		end
	end
	def telephone=(telephone)
		if Student.check_telephone?(telephone)
			@telephone = telephone
		else
			raise ArgumentError.new("Указан неправильный телефон пользователя!")
		end
	end
	def telegram=(telegram)
		if Student.check_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError.new("Указан неправильный Telegram пользователя!")
		end
	end





	def Student.string_parsing(str)
		if str.empty? || str.nil?
			raise ArgumentError.new("Строка пуста!")
		end
		student_atribute = {}
		str.split(';').each do |pars_str|
			key, val = pars_str.split(':').map(&:strip)
			case key.downcase
				when 'first_name'
					student_atribute[:first_name] = val
				when 'second_name'
					student_atribute[:second_name] = val
				when 'third_name'
					student_atribute[:third_name] = val
				when 'id'
					student_atribute[:id] = val
				when 'email'
					student_atribute[:email] = val
				when 'telephone'
					student_atribute[:telephone] = val
				when 'git'
					student_atribute[:git] = val
				when 'telegram'
					student_atribute[:telegram] = val
			end
		end
		return student_atribute
	end


	def Student.create_from_pars_string(str)
		pars_str = Student.string_parsing(str)
		Student.new(**pars_str)
	end


	def get_contact
		if self.validate
			if not(self.telegram.nil? || self.telegram.empty?)
				return "Telegram: #{self.telegram}"
			elsif not(self.telephone.nil? || self.telephone.empty?)
				return "Telephone: #{self.telephone}"
			elsif not(self.email.nil? || self.email.empty?)
				return "Email: #{self.email}"
			end
		else
			raise "У студенда нет ни 1 контакта для связи!"
		end
	end


	def get_info
		print ("#{get_second_name_and_initials}; #{get_git}; #{get_contact}; \n \n")
	end


	def has_telephone
		@telephone != nil || not(@telephone.empty?)
	end
	def has_tg
		@telegram != nil || not(@telegram.empty?)
	end
	def has_mail
		@email != nil || not(@email.empty?)
	end
	def validate
		has_git && (has_telephone || has_tg || has_mail)
	end


	def set_contacts(telegram, telephone, email)
		  	self.email = email
		  	self.telegram = telegram
		  	self.telephone = telephone
	end


	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n E-Mail студента:#{self.email}\n Телефон студента:#{self.telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n\n\n"
	end
end




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