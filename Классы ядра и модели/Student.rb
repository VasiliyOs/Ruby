class Student

  attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :email, :git

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

