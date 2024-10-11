class Student
  def id
    @id
  end
  def id=(id)
    @id = id
  end
  def first_name
    @first_name
  end
  def first_name=(first_name)
    @first_name = first_name
  end
  def second_name
    @second_name
  end
  def second_name=(second_name)
    @second_name = second_name
  end
  def third_name
    @third_name
  end
  def third_name=(third_name)
    @third_name = third_name
  end
  def telephone
    @telephone
  end
  def telephone=(telephone)
    @telephone=telephone
  end
  def telegram
    @telegram
  end
  def telegram=(telegram)
    @telegram=telegram
  end
  def git
    @git
  end
  def git=(git)
    @git=git
  end
  def email
    @email
  end
  def email=(email)
    @email = email
  end
  def initialize(first_name,second_name,third_name,id = nil,telephone = nil,telegram = nil,email = nil,git = nil)
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

