require './super_class_student.rb'
str = "first_name: Имя;second_name: Фамилия;third_name: Отчество;id: 2;Telephone:; Email: abc@mail.ru; git:; telegram:"
st1 = Student.create_from_pars_string(str)
print st1.to_s