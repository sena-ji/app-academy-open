class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless node.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    child_node.parent = nil
    raise "node is not a child!" unless @children.include?(child_node)
  end

  def dfs(target_value)
    return self if @value == target_value

    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      curr_node = queue.shift
      return curr_node if target_value == curr_node.value
      curr_node.children.each { |child| queue << child }
    end

    nil
  end
end