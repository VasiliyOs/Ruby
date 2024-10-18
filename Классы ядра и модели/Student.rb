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

  def full_name
    super
  end
  def get_contact
    super
  end

  def get_info
    return "ФИО:#{full_name}; Git:#{self.git}; #{get_contact[0]}:#{get_contact[1]}"
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

  def validate
    super
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
