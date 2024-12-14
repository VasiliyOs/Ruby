require 'C:\Node.rb'
require 'C:\Users\Василий Осипов\RubymineProjects\Tree_Stud\Student_tree.rb'
require 'C:\People.rb'
require 'C:\Student.rb'

student0 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru", birthday: '03-02-2023')
student1 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru", birthday: '05-05-1987')
student2 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru", birthday: '03-02-1999')
student3 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru", birthday: '09-04-2283')
student_arr = [student0, student1, student2, student3]

tree1 = Student_tree.new(student_arr)

tree_max = tree1.max
puts "Студент с максимальной датой:\n#{tree_max}"
puts "\n\n\n"
tree1.each{|node| puts node if node.value.birthday <= Date.parse('2000-01-01')}

