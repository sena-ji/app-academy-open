require_relative 'poly_tree_node'

class KnightPathFinder
  attr_accessor :root_node, :considered_positions

  POSSIBLE_MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]

  # found a good source that explains how to implement valid_moves
  # https://www.techiedelight.com/chess-knight-problem-find-shortest-path-source-destination/
  def self.valid_moves(pos)
    row, col = pos

    val_moves = POSSIBLE_MOVES.map do |move| 
      if (row + move.first).between?(0, 7) && (col + move.last).between?(0, 7)
        [row + move.first, col + move.last]
      end
    end

    val_moves.reject(&:nil?)
  end

  def initialize(start_pos)
    @root_node = PolyTreeNode.new(start_pos)
    @considered_positions = [start_pos]

    build_move_tree
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).select { |position| !@considered_positions.include?(position) }
    @considered_positions.concat(new_pos)
    return new_pos
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      curr_node = queue.shift

      new_move_positions(curr_node.value).each do |new_pos|
      child = PolyTreeNode.new(new_pos)
      curr_node.add_child(child)
      queue << child 
      end
    end

    nil
  end

  def find_path(end_pos)
    target_node = @root_node.bfs(end_pos)

    trace_path_back(target_node)
  end

  def trace_path_back(end_pos)
    curr_node = end_pos
    traced_nodes = []

    until curr_node.nil?
      traced_nodes << curr_node.value
      curr_node = curr_node.parent
    end

    traced_nodes.reverse
  end
end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end