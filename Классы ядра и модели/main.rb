require 'C:\Users\maise\RubymineProjects\untitled\Student.rb'

st1 = Student.new("Имя", "Фамилия","Отчество", id: 2, telephone: "8 800 555 35 35", telegram: "@Jack123", git: "VasiliyOs", email: "abc@mail.ru")
putst st1.to_s
st2 = Student.pars("first_name: Имя;second_name: Фамилия;third_name: Отчество;id: 3;Telephone:8 999 999 99 99; Email: abc@mail.ru; git:VasiliyOs; telegram:@Jackobs22")
print st2.to_s
puts st1.get_info
