require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    possible_moves = []



    next_mover_mark = 
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
