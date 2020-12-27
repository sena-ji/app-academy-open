require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
  end

  def losing_node?(evaluator)
    if @board.over?
      if @board.winner.nil? || @board.winner == evaluator
        return false
      else
        reuturn true
      end
    end
  end

  def winning_node?(evaluator)
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
      duped_board[pos] = next_mover_mark
      # alternate next_mover_mark
      next_mark = next_mover_mark == :x ? :o : :x
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
