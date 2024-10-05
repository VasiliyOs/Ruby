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

	private :telephone, :telegram, :email

	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n E-Mail студента:#{self.email}\n Телефон студента:#{self.telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n\n\n"
	end
end
