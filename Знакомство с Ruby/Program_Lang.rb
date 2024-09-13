argument = ARGV[0]

print "Привет, #{argument}! \n"
print "Напиши свой любимый ЯП:"
language = STDIN.gets.chomp
case language
    when 'java'
        print "Класс, но скоро полюбишь Ruby."
    when "ruby"
        print "Подлиза."
    when "python"
        print "Быстрее переходи на Ruby."
    when "assembler"
        print "Мне тебя жаль. Попробуй Ruby."
    when "pascal"
        print "Да. Переходи на Ruby."
    else
        print "Я такого языка не знаю."
end


print "Введите комманду Ruby:"
command_ruby = STDIN.gets.chomp #cохраняем кооманду в переменную
print "\nА теперь введите комманду OC:"
command_os = STDIN.gets.chomp #cохраняем кооманду в переменную

eval(command_ruby) #Выполняет комманду Ruby

system(command_os) #Выполняет комманду ОС
