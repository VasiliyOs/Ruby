class Tree_crawler
  include Enumerable

  attr_accessor :root

  def initialize(root)
    self.root = root
  end

  def BFS
    queue = [self.root]
    while queue.any?
      node = queue.shift
      yield node
      node.childs.each { |child| queue.push(child) }
    end
  end

  def DFS
    stack = [self.root]
    while stack.any?
      node = stack.pop
      yield node
      node.childs.reverse.each { |child| stack.push(child) }
    end
  end

  def each(&block)
    DFS(&block)
  end
end
