require './Student.rb'
require './Student_short.rb'
require './data_list_student_short.rb'
require './Data_list.rb'
require './Student_list.rb'
require 'C:\Users\Василий Осипов\Desktop\rb444\Strategy_lits.rb'
require 'json'
class Student_list_JSON < Strategy_list

  def read_from_file(filepath)
    json_data = JSON.parse(File.read(filepath), symbolize_names: true)
    student_array_hash = json_data.map {|json_student| Student.from_hash(**json_student)}
  end

  def write_to_file(filepath, student_array)
    student_array_hash = student_array.map(&:to_hash)
    File.open(filepath, 'w') do |file|
      file.write(JSON.pretty_generate(student_array_hash))
    end
  end
end
