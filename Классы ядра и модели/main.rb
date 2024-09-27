require 'C:\Users\Василий Осипов\class_student.rb'
st1 = Student.new("Имя1", "Отчество1", "Фмилия1", git: nil, telephone: "8(800)555 35 35", telegram: nil, id: 1)
st2 = Student.new("Имя2", "Отчество2", "Фмилия2", id: 2, telephone: "8(800)555 35 35", git: nil, telegram: nil)
puts st1.to_s
puts st2.to_s
