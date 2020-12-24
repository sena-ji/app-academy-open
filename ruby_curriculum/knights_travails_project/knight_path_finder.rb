require_relative 'poly_tree_node'

class KnightPathFinder
  attr_accessor :root_node, :considered_positions

  POSSIBLE_MOVES = [[1,2], [2,1], [-1, 2], [1, -2], [-2, 1], [2, -1], [-2, -1], [-1, -2]]

  # found a good source that explains how to implement valid_moves
  # https://www.techiedelight.com/chess-knight-problem-find-shortest-path-source-destination/
  def self.valid_moves(pos)
    row, col = pos

    new_moves = POSSIBLE_MOVES.map do |move| 
      if (row + move.first).between?(0, 7) && (col + move.last).between?(0, 7)
        [row + move.first, col + move.last]
      end
    end

    new_moves.reject(&:nil?)
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
end