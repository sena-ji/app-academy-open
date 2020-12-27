require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
  end

  def losing_node?(evaluator)
    # base case: the board is over AND
    if @board.over?
      # if winner is nil OR us, this is not a losing node
      return false if @board.winner.nil? || @board.winner == evaluator
      # a draw is NOT a loss, if a nose is a draw, losing_node? should return false
      return false if @board.tied?
      # if winner is the opponent, this is a losing node
      return true
    end
    
    # it is the player's turn (got confused and realized this was the "computer ai")
    if @next_mover_mark == evaluator
      # all the children nodes are losers for the player
      self.children.all? { |child_node| child_node.losing_node?(evaluator) }
    # OR
    else
      # it is opponent's turn and one of the children nodes is a losing node for player
      # assumes your opponent played perfectly and led you to a losing node
      self.children.any? { |child_node| child_node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    # base case: the board is over AND
    if @board.over?
      # if winner is nil OR the opponent, this is not a winning node
      return false if @board.winner.nil? || @board.winner != evaluator
      # if winner is us, this is a winning node
      return true
    end

    # it is the player's turn
    if @next_mover_mark == evaluator
      # one of the children nodes is a winning node for the player
      self.children.any? { |child_node| child_node.winning_node?(evaluator) }
    # OR
    else
      # it is the opponent's turn, and all of the children nodes are winning nodes for the player
      self.children.all? { |child_node| child_node.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_nodes = []

    # iterate through all positions that are empty?
    # for each empty position
    get_empty_pos.each do |pos|
      # create a node by duping the board
      duped_board = @board.dup
      # put a next_mover_mark in the position
      duped_board[pos] = @next_mover_mark
      # alternate next_mover_mark
      next_mark = @next_mover_mark == :x ? :o : :x
      # set prev_move_pos to position you just marked
      new_possible_node = TicTacToeNode(duped_board, next_mark, pos)
      possible_nodes << new_possible_node
    end

    possible_nodes
  end

  # helper function to get empty positions on board
  # children function was getting too long with all the enumerables
  def get_empty_pos
    empty_pos = []

    @board.rows.each_with_index do |row, r_idx|
      row.each_with_index do |pos, c_idx|
        if pos.empty?
          empty_pos << [r_idx, c_idx]
        end
      end
    end

    empty_pos
  end
end
