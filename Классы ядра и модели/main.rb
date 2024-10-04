require './super_class_student.rb'
require './class_short_student.rb'
str = "first_name: Имя;second_name: Фамилия;third_name: Отчество;id: 2;Telephone:8 800 555 35 35; Email: abc@mail.ru; git:arab; telegram:@Jack12"
st1 = Student.create_from_pars_string(str)
puts st1.get_info


sh_str = "id: 3; second_name_and_initials: Осипов В.Р.; git: aboba; contact: abc@mail.ru"
sh_st1 = Student_short.create_from_pars_string(sh_str)
puts sh_st1.get_info
sh_st2 = Student_short.new(id: 3, second_name_and_initials: "Осипов В.Р.", git: "aboba", contact:"@Jack228")
puts sh_st2.to_s
