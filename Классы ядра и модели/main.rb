require 'C:\Users\Василий Осипов\class_student.rb'

str = "first_name: Имя;second_name: Фамилия;third_name: Отчество;id: 2;Telephone:; Email: abc@mail.ru; git:; telegram:"
st3 = Student.create_from_pars_string(str)
print st3.to_s
