class Student
	def Student.check_id?(id)
		id_regex = /\A\d+\z/
		return true if id.nil?
		id = id.to_s
		(id =~ id_regex)
	end
	def Student.check_first_name?(first_name)
		fname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		return true if first_name.nil?
		first_name =~ fname_regex
	end
	def Student.check_second_name?(second_name)
		sname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		return true if second_name.nil?	
		second_name =~ sname_regex
	end
	def Student.check_third_name?(third_name)
		tname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		return true if third_name.nil?
		third_name =~ tname_regex
	end
	def Student.check_telephone?(phone_number)
		phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
		return true if phone_number.nil?
		phone_number =~ phone_regex
	end
	def Student.check_github?(git)
		github_regex = /^(?![-_.])([a-zA-Z0-9._-]{1,39})(?<![-_.])$/
		return true if git.nil?
		git =~ github_regex
	end
	def Student.check_telegram?(telegram)
		telegram_regex = /^@[a-zA-Z0-9._]{5,32}$/
		return true if telegram.nil?
		telegram =~ telegram_regex
	end
	def Student.check_mail?(email)
		email_regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
		return true if email.nil?
		email =~ email_regex
	end


	attr_reader :telegram, :git, :telephone, :first_name, :second_name, :third_name, :id, :email


	def first_name=(first_name)
		if Student.check_first_name?(first_name)
			@first_name = first_name
		else
			raise ArgumentError.new("Указано неправильное имя пользователя!")
		end
	end
	def second_name=(second_name)
		if Student.check_second_name?(second_name)
			@second_name = second_name
		else
			raise ArgumentError.new("Указана неправильная фамилия пользователя!")
		end
	end
	def third_name=(third_name)
		if Student.check_third_name?(third_name)
			@third_name = third_name
		else
			raise ArgumentError.new("Указано неправильное отчество пользователя!")
		end
	end
	def id=(id)
		if Student.check_id?(id)
			@id = id
		else
			raise ArgumentError.new("Указано неправильное ID пользователя!")
		end
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
	def git=(git)
		if Student.check_github?(git)
			@git = git
		else
			raise ArgumentError.new("Указан неправильный Git пользователя!")
		end
	end
	def telegram=(telegram)
		if Student.check_telegram?(telegram)
			@telegram = telegram
		else
			raise ArgumentError.new("Указан неправильный Telegram пользователя!")
		end
	end


	def initialize(first_name: , second_name: , third_name:, id:nil, email:nil, telephone: nil, git: nil, telegram: nil)
		self.id = id
		self.first_name = first_name
		self.second_name = second_name
		self.third_name = third_name
		set_contacts(git, telegram, telephone, email)
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



	def has_git
		@git != nil
	end
	def has_telephone
		@telephone != nil
	end
	def has_tg
		@telegram != nil
	end
	def has_mail
		@email != nil
	end
	def validate
		has_git && (has_telephone || has_tg || has_mail)
	end


	def set_contacts(git, telegram, telephone, email)
		  	self.git = git
		  	self.email = email
		  	self.telegram = telegram
		  	self.telephone = telephone
	end


	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n E-Mail студента:#{self.email}\n Телефон студента:#{self.telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n\n\n"
	end
end