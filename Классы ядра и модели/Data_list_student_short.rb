require_relative 'Data_list.rb'
require_relative 'Student_short.rb'
require_relative 'Data_table.rb'

class Data_list_student_short < Data_list
  attr_accessor :array, :view, :num

  def initialize(array)
    super(array)
  end

  def set_view(view)
    self.view = view
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
    Data_table.new(matrix)
  end

  def get_names
    student_short_fields = []
    student_short_fields += self.array[0].instance_variables
    student_short_fields.delete(:@id)
    student_short_fields
  end

  def notify
    self.view.set_table_params(get_names, self.num)
    self.view.set_table_data(get_value(self.get_names))
  end

  def get_data
    super
  end
end