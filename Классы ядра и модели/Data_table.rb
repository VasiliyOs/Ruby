class DataTable
  attr_accessor :matrix

  private :matrix, :matrix=

  def initialize(matrix)
    self.matrix = matrix
  end

  def [](row_ind, column_ind)
    if !matrix[row_ind][column_ind].nil?
      self.matrix[row_ind][column_ind]
    end
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

