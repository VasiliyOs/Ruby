require 'pg'
require 'C:\Users\Василий Осипов\Desktop\rb444\Data_list_student_short.rb'
class DB_work
  attr_accessor :student_db

  def initialize
    self.student_db = Student_list_DB.instance
  end

  def get_student_by_id(id)
    self.student_db.get_student_by_id(id)
  end

  def get_k_n_students(page:, amount_rows: 20)
    self.student_db.get_k_n_students(page:, amount_rows:20)
  end

  def add_student(student)
    self.student_db.add_student(student)
  end

  def update_on_id(id, student)
    self.student_db.update_on_id(id, student)
  end

  def delete_on_id(id)
    self.student_db.delete_on_id(id)
  end

  def get_count
    self.student_db.get_count
  end
end
