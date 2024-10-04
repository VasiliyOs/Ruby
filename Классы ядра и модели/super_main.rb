require './super_class_student.rb'
people = People.new(first_name: 'Василий', second_name: 'Осипов', third_name: 'Романович', id: 1, git: "VasiliyOs")
puts people.to_s

student1 = Student.new(first_name: 'Василий', second_name: 'Осипов', third_name: 'Романович', telephone: '8 800 555 35 35', telegram: "@Jack123", email: "abc@gmail.com", git: "VasiliyOs")
puts student1
    
student_short1 = Student_short.create_from_student(student1)
puts student_short1
    
student_short2 = Student_short.create_from_string(id: 2, data: "Осипов В.Р. VasiliyOs abc@gmail.com")
puts student_short2