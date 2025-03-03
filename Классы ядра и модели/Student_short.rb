require 'C:\Users\maise\RubymineProjects\untitled\People.rb'
class Student_short < People

  attr_reader :full_name, :contact_name

  def initialize(first_name, second_name, third_name, id: nil, git: nil, contact: nil, contact_name: nil)
    super(first_name, second_name, third_name, git: git, id: id)
    self.full_name = full_name
    self.contact = contact
    self.contact_name = contact_name
  end

  private_class_method :initialize

  def full_name
    super
  end
  def full_name=(full_name)
    @full_name = full_name
  end
  def contact_name=(contact_name)
    @contact_name = contact_name
  end

  def Student_short.pars(str)
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
    return super.git, "#{get_pars_contact(telephone, telegram, email)[0]}", "#{get_pars_contact(telephone,telegram, email)[1]}", super.second_name, super.first_name, super.third_name
  end

  def Student_short.get_pars_contact(telephone, telegram, email) #Метод класса так как я его должен использовать без экземпляра, он применяется в методе класса pars для парса строки и нахождения контакта. Вроде можно добавть телефон и другие контакты и использовать super. Ещё можно дополнить метод pars и находить контакт подругому.
    if telephone != nil
      contact_name = "Телефон"
      contact = telephone
    elsif telegram != nil
      contact_name = "Телеграм"
      contact = telegram
    elsif email != nil
      contact_name = "Email"
      contact = email
    end
    return contact_name, contact
  end

  def Student_short.student_in_short_student(student)
    id = student.id
    git = student.git
    contact = student.get_contact[1]
    contact_name = student.get_contact[0]
    return Student_short.new(student.first_name,student.second_name,student.third_name,id: id, git: git, contact: contact, contact_name: contact_name)
  end

  def Student_short.initialize_from_string(id: nil, string: nil)
    id = id
    git = Student_short.pars(string)[0]
    contact_name = Student_short.pars(string)[1]
    contact = Student_short.pars(string)[2]
    second_name = Student_short.pars(string)[3]
    first_name = Student_short.pars(string)[4]
    third_name = Student_short.pars(string)[5]
    return Student_short.new(first_name, second_name, third_name,id: id, git: git, contact: contact, contact_name: contact_name)
  end

  def to_s
    "ФИО:#{full_name}\nID:#{self.id}\nGit:#{self.git}\n#{self.contact_name}:#{self.contact}\n\n\n"
  end
end
