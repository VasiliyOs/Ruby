class People

  attr_reader :id, :first_name, :second_name, :third_name, :git, :contact

  def People.check_telephone?(phone_number)
    phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
    return true if phone_number.nil?
    phone_number =~ phone_regex
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
  def People.check_id?(id)
    id_regex = /\A\d+\z/
    return true if id.nil?
    id = id.to_s
    (id =~ id_regex)
  end
  def People.check_first_name?(first_name)
    fname_regex = /\A[А-ЯЁ][а-яё.\-]+\z/
    first_name =~ fname_regex
  end
  def People.check_second_name?(second_name)
    sname_regex = /\A[А-ЯЁ][а-яё.\-]+\z/
    second_name =~ sname_regex
  end
  def People.check_third_name?(third_name)
    tname_regex = /\A[А-ЯЁ][а-яё.\-]+\z/
    third_name =~ tname_regex
  end
  def People.check_github?(git)
    github_regex = /^(?![-_.])([a-zA-Z0-9._-]{1,39})(?<![-_.])$/
    return true if git.nil?
    git =~ github_regex
  end


  def get_contact
    if self.contact != nil and People.check_telephone?(self.contact)
      contact_name = "Телефон"
      contact = self.contact
    elsif self.telegram != nil and People.check_telegram?(self.contact)
      contact_name = "Телеграм"
      contact = self.telegram
    elsif self.email != nil and People.check_mail?(self.contact)
      contact_name = "Email"
      contact = self.email
    end
    return contact_name, contact
  end


  def contact=(contact)
    if People.check_telephone?(contact) or People.check_telegram?(contact) or People.check_mail?(contact)
      @contact = contact
    else
      raise ArgumentError.new("Указан неправильный контакт!")
    end
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

  protected :contact=

  def has_git
    if self.git != nil
      true
    else
      false
    end
  end
  def has_contact
    if self.contact != nil
      true
    else
      false
    end
  end
  def validate
    if has_git and has_contact
      true
    else
      false
    end
  end

  def full_name
    return "#{self.second_name} #{self.first_name[0]}.#{self.third_name[0]}."
  end

  def People.pars(str)
    if str.empty? || str.nil?
      raise ArgumentError.new("Строка пуста!")
    end
    first_name, second_name, third_name, id, git = nil
    str.split(';').each do |pars_str|
      key, val = pars_str.split(':').map(&:strip)
      case key.downcase
      when 'first_name'
        first_name = val
      when 'second_name'
        second_name = val
      when 'third_name'
        third_name = val
      when 'git'
        git = val
      when 'id'
        id = val
      end
    end
    return People.new(first_name, second_name, third_name, id: id, git: git)
  end

  def initialize(first_name,second_name,third_name, id: nil, git: nil, contact: nil)
    self.id = id
    self.first_name = first_name
    self.second_name = second_name
    self.third_name = third_name
    self.git = git
    self.contact = contact
  end

  def to_s
    "Имя:#{self.first_name}\nФамилия:#{self.second_name}\nОтчество:#{self.third_name}\nID:#{self.id}\nGit:#{self.git}\n\n\n"
  end
end
