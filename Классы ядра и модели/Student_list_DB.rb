require 'pg'
class Student_list_DB
  attr_accessor :connection
  private :connection=

  @instance = nil

  attr_accessor :connection
  def initialize
    (1..10).each do |attempt|
      self.connection = PG.connect(
        dbname: 'Students',
        user: 'postgres',
        password: '111',
        host: 'localhost',
        port: 5432
      )
    end
  end

  private_class_method :new
  private :connection

  def self.instance
    @instance ||= self.new
  end

  def get_student_by_id(id)
    self.connection.exec("SELECT * FROM student where \"ID\"=#{id};")
  end
  def get_k_n_students(page:, amount_rows: 20)
    arr = []
    self.connection.exec("SELECT * FROM student LIMIT #{amount_rows} OFFSET #{(page-1) * amount_rows};") do |result|
      result.each do |row|
        arr << row
      end
    end
    arr
  end
  def add_student(student)
    self.connection.exec("INSERT INTO student VALUES (#{student.id}, '#{student.first_name}', '#{student.second_name}', '#{student.third_name}', '#{student.git}', '#{student.telephone}', '#{student.telegram}', '#{student.email}')")
  end
  def update_on_id(id, student)
    self.connection.exec("UPDATE student SET \"ID\"=#{student.id}, \"first_name\"='#{student.first_name}', \"second_name\"='#{student.second_name}', \"third_name\"='#{student.third_name}', \"git\"='#{student.git}', \"telephone\"='#{student.telephone}', \"telegram\"='#{student.telegram}', \"email\"='#{student.email}' WHERE \"ID\"=#{id}")
  end
  def delete_on_id(id)
    self.connection.exec("DELETE FROM student WHERE \"ID\"=#{id}")
  end
  def get_count
    self.connection.exec("SELECT COUNT(*) FROM student")
  end
end