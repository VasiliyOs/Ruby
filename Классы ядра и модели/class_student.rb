class Student
	def check_id?(id)
		id_regex = /\A\d+\z/
		id = id.to_s
		!!(id =~ id_regex)
		end
	def check_first_name?(first_name)
		fname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		!!(first_name =~ fname_regex)
		end
	def check_second_name?(second_name)
		sname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		!!(second_name =~ sname_regex)
	end
	def check_third_name?(third_name)
		tname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
		!!(third_name =~ tname_regex)
	end
	def check_telephone?(phone_number)
		phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
		!!(phone_number =~ phone_regex)
	end
	def check_github?(git)
		github_regex = /^github\.com\/[A-Za-z0-9._-]+\/?$/
		!!(git =~ github_regex)
	end
	def check_telegram?(telegram)
		telegram_profile_regex = /\A@[a-zA-Zа-яА-Я0-9._]+\z/
		!!(telegram =~ telegram_profile_regex)
	end


	attr_accessor :id, :first_name, :second_name, :third_name
	attr_reader :telegram, :git, :telephone


	def initialize(first_name, second_name, third_name, info = {})
		if (check_id?(info[:id]) == true)
			self.id = info[:id]
		else
		  	self.id = nil
		end
		if (check_first_name?(first_name) == true)
		  	self.first_name = first_name
		else
		  	first_name = "ERROR"
		end
		if (check_second_name?(second_name) == true)
		  	self.second_name = second_name
		else
		  	second_name = "ERROR"
		end
		if (check_third_name?(third_name) == true)
		  	self.third_name = third_name
		else
		  	third_name = "ERROR"
		end
		if (check_telephone?(info[:telephone]) == true)
		  	@telephone = info[:telephone]
		else
		  	@telephone = nil
		end
		if (check_github?(info[:git]) == true)
		  	@git = info[:git]
		else
		  	@git = nil
		end
		if (check_telegram?(info[:telegram]) == true)
		  	@telegram = info[:telegram]
		else
		  	@telegram = nil
		end
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
	def validate
		has_git && (has_telephone || has_tg)
	end


	def set_contacts(git, telegram, telephone)
		if (check_github?(git) == true)
		  	@git = git
		else
		  	@git = nil
		end
		if (check_telegram?(telegram) == true)
		  	@telegram = telegram
		else
		  	@telegram = nil
		end
		if (check_telephone?(telephone) == true)
		  	@telephone = telephone
		else
		  	@telephone = nil
		end
	end


	def to_s
		"Имя студента:#{self.first_name}\n Фамилия студента:#{self.second_name}\n Отчество студента:#{self.third_name}\n ID студента:#{self.id}\n Телефон студента:#{@telephone}\n Телеграм студента:#{self.telegram}\n Гит студента:#{self.git}\n\n\n"
	end
end
