require 'C:\Users\Василий Осипов\RubymineProjects\untitled\tags.rb'
require 'C:\Users\Василий Осипов\RubymineProjects\untitled\tree_crawler.rb'
require 'C:\Users\Василий Осипов\RubymineProjects\untitled\tr.rb'

html ="<HTML>
  <div>
    <h1 class='harakiri'>Заголовок</h1>
    <p>Некоторый текст.</p>
    <ul size=50 class='net'>
      <li>Пункт 1</li>
      <li>Пункт 2</li>
    </ul>
    <div>123</div>
  </div>
</HTML>"
root = HTML_tree.new(html)
puts root.to_s
puts
tree_crawler = Tree_crawler.new(root.root)
tree_crawler.BFS{|root| puts root.name}
puts
tree_crawler.DFS{|root| puts root.name}
tree_with_values = tree_crawler.find_all{|root| root.has_values?}
puts
tree_with_values.each {|root| puts root.name }
puts
tree_crawler.each {|root| puts root.tag_name_and_atribute  }