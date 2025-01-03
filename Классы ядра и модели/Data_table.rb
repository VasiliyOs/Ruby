class Data_table
  attr_accessor :matrix

  private :matrix, :matrix=

  def initialize(matrix)
    self.matrix = matrix
  end

  def [](row_ind, column_ind)
    self.matrix[row_ind][column_ind]
  end

  def columns_count
    self.matrix.max_by{|a| a.size}.size
  end

  def rows_count
    self.matrix.size
  end
  
  def to_s
    self.matrix.to_s
  end
end
