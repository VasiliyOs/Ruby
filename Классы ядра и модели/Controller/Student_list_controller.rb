require 'fox16'
require_relative 'Student_list_view.rb'
require_relative 'Student_list.rb'
require_relative 'Data_list_student_short.rb'
include Fox

class Student_list_controller
  def initialize(view)
    @view = view
    @student_list = Student_list.new(filepath: "C:\\rb444\\file.json", strategy: Student_list_JSON.new)
    @data_list = Data_list_student_short.new([])
    @data_list.set_view(view)
  end

  def refresh_data
    @student_list.read_from_file
    @data_list = @student_list.get_k_n_student_short_list(@view.page_now, amount_rows: @view.rows_on_page, data_list: @data_list)
    @data_list.num = @student_list.student_array.count
    @data_list.notify
  end


  def reset_filters
    @view.reset_filters
  end
end

