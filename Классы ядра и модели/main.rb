require 'C:\Users\maise\RubymineProjects\untitled\People.rb'
require 'C:\Users\maise\RubymineProjects\untitled\Student.rb'
require 'C:\Users\maise\RubymineProjects\untitled\Student_short.rb'

st1 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru")
st2 = Student.pars("first_name: Имя;second_name: Фамилия;third_name: Отчество;id: 3;Telephone:8 999 999 99 99; Email: abc@mail.ru; git:VasiliyOs; telegram:@Jackobs22")
puts st1.to_s
puts st2.to_s


st1_s = Student_short.student_in_short_student(st1)
puts st1_s.to_s
st2_s =  Student_short.initialize_from_string(id: 3, string: "first_name:Имя; second_name:Фамилия; third_name: Отчество; Telephone:8 777 77 77; Email:abc@mail.ru; git:VasiliyOs; telegram:@Jackobs22")
puts st2_s.to_s
