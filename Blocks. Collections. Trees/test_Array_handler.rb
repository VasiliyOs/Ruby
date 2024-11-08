require 'minitest/autorun'
require 'C:\Users\Василий Осипов\RubymineProjects\untitled\array_handler.rb'

class TestArrayHandler < Minitest::Test
  def setup
    @array_handler = Array_handler.new([1, 2, 3, 4, 5])
  end

  def test_find_all
    result = @array_handler.find_all { |elem| elem > 2 }
    assert [3, 4, 5], result

    result = @array_handler.find_all { |elem| elem.even? }
    assert [2, 4], result
  end

  def test_min_max
    result = @array_handler.min_max
    assert [1, 5], result
  end

  def test_reduce
    result = @array_handler.reduce { |elem| elem -1 }
    assert [0, 1, 2, 3, 4], result

    result = @array_handler.reduce { |elem| elem * 2 }
    assert [2, 4, 6, 8, 10], result
  end

  def test_find_index
    result = @array_handler.find_index { |elem| elem == 3 }
    assert 2, result
  end

  def test_any?
    result = @array_handler.any? { |elem| elem > 4 }
    assert_equal true, result

    result = @array_handler.any? { |elem| elem > 5 }
    assert_equal false, result
  end
end