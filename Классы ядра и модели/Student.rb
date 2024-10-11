require 'C:\Users\maise\RubymineProjects\untitled\People.rb'
class Student < People

  attr_reader :telephone, :telegram, :email

  def initialize(first_name, second_name, third_name, id: nil, git: nil, telephone: nil, telegram: nil, email: nil)
    super(first_name,second_name,third_name,id: id, git: git)
    set_contact(telephone,telegram,email)
  end

  def set_contact(telephone, telegram, email)
    self.telephone = telephone
    self.telegram = telegram
    self.email = email
  end
  def get_contact
    if self.telephone != nil
      contact_name = "Телефон"
      contact = self.telephone
    elsif self.telegram != nil
      contact_name = "Телеграм"
      contact = self.telegram
    elsif self.email != nil
      contact_name = "Email"
      contact = self.email
    end
    return contact_name, contact
  end
  def get_info
    return "ФИО:#{full_name}; Git:#{self.git}; #{get_contact[0]}:#{get_contact[1]}"
  end
  def full_name
    return "#{self.second_name} #{self.first_name[0]}.#{self.third_name[0]}."
  end

  def Student.check_telephone?(phone_number)
    phone_regex = /^(?:\+7|8)\s*\(?(?:\d{3})\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$/
    return true if phone_number.nil?
    phone_number =~ phone_regex
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
  def has_contact
    if self.telephone != nil || self.telegram != nil || self.email != nil
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

  def Student.pars(str)
    super(str)
    telephone, email, telegram = nil
    str.split(';').each do |pars_str|
      key, val = pars_str.split(':').map(&:strip)
      case key.downcase
      when 'email'
        email = val
      when 'telephone'
        telephone = val
      when 'telegram'
        telegram = val
      end
    end
    return Student.new(super.first_name, super.second_name, super.third_name, git: super.git, id:super.id, telephone: telephone, telegram: telegram, email: email)
  end
  def to_s
    "Имя:#{self.first_name}\nФамилия:#{self.second_name}\nОтчество:#{self.third_name}\nID:#{self.id}\nТелефон:#{self.telephone}\nТелегрма:#{self.telegram}\nEmail:#{self.email}\nGit:#{self.git}\n\n\n"
  end
end
