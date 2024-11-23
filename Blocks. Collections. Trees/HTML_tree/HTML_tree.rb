require 'C:\Users\Василий Осипов\RubymineProjects\untitled\tags.rb'
require 'C:\Users\Василий Осипов\RubymineProjects\untitled\tree_crawler.rb'
class HTML_tree
  attr_accessor :root

  def initialize(html)
    self.root = parse(html)
  end

  def parse(html)
    now_node = nil
    stack = []
    while html.strip.length > 0
      start_ind = html.index("<")
      end_ind = html.index(">")

      break if start_ind.nil? || end_ind.nil?

      tag = html[(start_ind + 1)...end_ind]
      if tag.start_with?("/")
        now_node = stack.pop
        break if now_node.nil?
        html = html[(end_ind + 1)..-1]
        next
      end

      text_start = end_ind + 1
      text_end = html.index("<", text_start)
      text_end = html.length if text_end.nil?
      tag_name = tag.sub("<","").sub(">","").split[0]
      attributes = tag.sub("<","").sub(">","").split[1..-1]
      value = html[text_start...text_end].strip

      element = Tags.new(tag_name, value, attributes)

      if now_node.nil?
        self.root = element
        now_node = element
      else
        now_node.add_child(element)
      end
      stack.push(now_node)
      now_node = element
      html = html[text_end..-1]
    end
    self.root
  end

  def to_s(node = root, depth = 0)
    result = " " * (depth * 4) + "<#{node.name}"
    result += " " + node.atribute.join(" ")
    result += ">"
    result += " #{node.values}"
    result += "\n"
    node.childs.each do |child|
      result += to_s(child, depth + 1)
    end
    result += " " * (depth * 4) + "</#{node.name}>\n"
    result
  end
end


