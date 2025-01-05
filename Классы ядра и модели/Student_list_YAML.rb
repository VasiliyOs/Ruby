require './Student.rb'
require './Student_short.rb'
require './data_list_student_short.rb'
require './Student_list.rb'
require 'C:\Users\Василий Осипов\Desktop\rb444\Strategy_lits.rb'
require 'yaml'
require 'date'
class Student_list_YAML < Strategy_list

  def read_from_file(filepath)
    yaml_data = YAML.safe_load(File.read(filepath), permitted_classes: [Date, Symbol])
    student_array = yaml_data.map {|yaml_student| Student.from_hash(**yaml_student)}
  end
  def write_to_file(filepath, student_array)
    hash_student_array = student_array.map(&:to_hash)
    File.open(filepath, 'w') do |file|
      file.write(YAML.dump(hash_student_array))
    end
  end
end
