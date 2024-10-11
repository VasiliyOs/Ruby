class Student

  attr_reader :id, :first_name, :second_name, :third_name, :telephone, :telegram, :email, :git

  def Student.check_id?(id)
    id_regex = /\A\d+\z/
    return true if id.nil?
    id = id.to_s
    (id =~ id_regex)
  end
  def Student.check_first_name?(first_name)
    fname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
    first_name =~ fname_regex
  end
  def Student.check_second_name?(second_name)
    sname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
    second_name =~ sname_regex
  end
  def Student.check_third_name?(third_name)
    tname_regex = /\A[А-ЯЁ][а-яё\-]+\z/
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


  def initialize(first_name,second_name,third_name,id: nil,telephone: nil,telegram: nil,email: nil,git: nil)
    self.id = id
    self.first_name = first_name
    self.second_name = second_name
    self.third_name = third_name
    self.telephone = telephone
    self.telegram = telegram
    self.email = email
    self.git = git
  end
  def to_s
    "Имя:#{self.first_name}\nФамилия:#{self.second_name}\nОтчество:#{self.third_name}\nID:#{self.id}\nТелефон:#{self.telephone}\nТелегрма:#{self.telegram}\nEmail:#{self.email}\nGit:#{self.git}\n\n\n"
  end
end


