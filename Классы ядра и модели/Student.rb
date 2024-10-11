class Student

  attr_accessor :id, :first_name, :second_name, :third_name, :telephone, :telegram, :email, :git

  def initialize(first_name, second_name, third_name, info ={})
    self.id = info[:id]
    self.first_name = first_name
    self.second_name = second_name
    self.third_name = third_name
    self.telephone = info[:telephone]
    self.telegram = info[:telegram]
    self.email = info[:email]
    self.git = info[:git]
  end
  def to_s
    "Имя:#{self.first_name}\nФамилия:#{self.second_name}\nОтчество:#{self.third_name}\nID:#{self.id}\nТелефон:#{self.telephone}\nТелегрма:#{self.telegram}\nEmail:#{self.email}\nGit:#{self.git}\n\n\n"
  end
end
