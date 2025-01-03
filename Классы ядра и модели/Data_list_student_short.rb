require 'C:\Users\Василий Осипов\Desktop\rb444\Data_list.rb'
require 'C:\Users\Василий Осипов\Desktop\rb444\Student_short.rb'
require 'C:\Users\Василий Осипов\Desktop\rb444\Data_table.rb'

class DataListStudentShort < Data_list
  attr_accessor :array

  private :array, :array=
  def initialize(array)
    super(array)
  end

  def get_value(name_atr)
    matrix = []
    self.array.each do |stud|
      num = matrix.count + 1
      val_atr = []
      val_atr << num
      name_atr.each do |val|
        val_atr << stud.instance_variable_get(val)
      end
      matrix << val_atr
    end
    DataTable.new(matrix)
  end

  def get_names
    student_short_fields = []
    student_short_fields += self.array[0].instance_variables
    student_short_fields.delete(:@id)
    student_short_fields
  end

  def get_data
    super
  end
end