require './Student.rb'
require './Student_short.rb'
require './data_list_student_short.rb'
require 'C:\Users\Василий Осипов\Desktop\rb444\Strategy_lits.rb'
class Student_list

  include Comparable

  attr_accessor :filepath, :strategy
  attr_reader :student_array

  def initialize(filepath: , strategy:, student_array: nil)
    self.filepath = filepath
    self.student_array = student_array
    self.strategy = strategy
  end
  def student_array=(student_array)
    if student_array.nil? or student_array.is_a?(Array)
      @student_array = student_array
    else
      raise TypeError.new('Неверный тип входных данных')
    end
  end

  def write_to_file
    student_array.each do |elem1|
      if self.student_array.any?{|elem2| elem2 == elem1 and !elem1.equal?(elem2)}
        raise ArgumentError.new("В массиве присутсвтуют 2 или более элементов с одинаковыми харакетристиками!!!")
      end
    end
    self.strategy.write_to_file(self.filepath, self.student_array)
  end

  def read_from_file
    self.student_array = self.strategy.read_from_file(self.filepath)
  end

  private :filepath=, :student_array=

  def get_student_by_id(id)
    self.student_array.find{|student| student.id == id}
  end

  def get_k_n_student_short_list(page, amount_rows: 10, data_list: nil)
    if page <= 0
      raise ArgumentError.new('Недопустимый номер страницы!')
    end
    student_short_array = self.student_array.each_with_object([]) {|student, array| array.append(Student_short.student_in_short_student(student))}
    start_index = (page-1) * amount_rows
    end_index = [start_index + amount_rows - 1, student_short_array.size - 1].min
    data_list = Data_list.new(student_short_array[start_index..end_index])
  end

  def sort_by_name
    self.student_array.sort_by {|student| student.full_name}
  end

  def add_student(student)
    if self.student_array.any?{|elem| elem == student}
      raise ArgumentError.new("Элемент с такими характеристиками уже есть!!!")
    end
    self.student_array.append(student)
  end

  def replace_student_by_id(id, new_student)
    if self.student_array.any?{|elem| elem == new_student}
      raise ArgumentError.new("Элемент с такими характеристиками уже есть!!!")
    end
    index = self.student_array.find_index {|student| student.id == id}
    if index
      self.student_array[index] = new_student
    else
      raise ArgumentError.new("Такого ID не существует!")
    end
  end

  def delete_student_by_id(id)
    self.student_array.delete{|student| student.id == id}
  end

  def get_student_short_count
    self.student_array.size
  end
end
