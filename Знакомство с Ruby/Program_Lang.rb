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
