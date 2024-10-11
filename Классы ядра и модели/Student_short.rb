class Student_short

  attr_accessor :id, :full_name, :git, :contact

  def initialize(full_name, id:, git:, contact:)
    self.id = id
    self.full_name = full_name
    self.git = git
    self.contact = contact
  end

  private_class_method :initialize

  def Student_short.get_contact(telephone,telegram,email)
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

  def Student_short.pars(str)
    if str.empty? || str.nil?
      raise ArgumentError.new("Строка пуста!")
    end
    first_name, second_name, third_name, telephone, email, git, telegram = nil
    str.split(';').each do |pars_str|
      key, val = pars_str.split(':').map(&:strip)
      case key.downcase
      when 'first_name'
        first_name = val
      when 'second_name'
        second_name = val
      when 'third_name'
        third_name = val
      when 'id'
        id = val
      when 'email'
        email = val
      when 'telegram'
        telegram = val
      when 'telephone'
        telephone = val
      when 'git'
        git = val
      end
    end
    return  git, "#{get_contact(telephone,telegram,email)[0]}", "#{get_contact(telephone,telegram,email)[1]}", "#{second_name} #{first_name[0]}. #{third_name[0]}."
  end

  def Student_short.student_in_short_student(student)
    id = student.id
    full_name = "#{student.second_name} #{student.first_name[0]}. #{student.third_name[0]}."
    git = student.git
    contact = "#{get_contact(student.telephone, student.telegram, student.email)[0]}:#{get_contact(student.telephone, student.telegram, student.email)[1]}"
    return Student_short.new(full_name, id: id, git: git, contact: contact)
  end

  def Student_short.initialize_from_string(id: nil, string: nil)
    id = id
    git = Student_short.pars(string)[0]
    contact = "#{Student_short.pars(string)[1]}:#{Student_short.pars(string)[2]}"
    full_name = Student_short.pars(string)[3]
    return Student_short.new(full_name, id: id, git: git, contact: contact)
  end

  def to_s
    "ФИО:#{full_name}\nID:#{self.id}\nGit:#{self.git}\n#{self.contact}\n\n\n"
  end
end

