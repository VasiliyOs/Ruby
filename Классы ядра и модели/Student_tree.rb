require 'C:\Student.rb'
require '/Node.rb'
class Student_tree

  include Enumerable
  attr_accessor :root
  private :root=

  def initialize(array)
    if array.nil?
      raise ArgumentError.new('Пустой аргумент!')
    end

    self.root = Node.new(lefter: nil, righter: nil, value: array[0])

    array[1..].each do |elem|
      add_node(self.root, elem)
    end
  end

  def add_node(node, elem)
    if elem < node.value
      if node.lefter.nil?
        node.lefter = Node.new(lefter: nil, righter: nil, value: elem)
      else
        add_node(node.lefter, elem)
      end
    else
      if node.righter.nil?
        node.righter = Node.new(lefter: nil, righter: nil, value: elem)
      else
        add_node(node.righter, elem)
      end
    end
  end

  def each(&block)
    self.root.each(&block)
  end

  def print_n(node)
    if !(node.nil?)
      puts node.value
      print_n(node.lefter) if lefter
      print_n(node.righter) if righter
    end
  end

  def to_s
    self.value.to_s
  end
end