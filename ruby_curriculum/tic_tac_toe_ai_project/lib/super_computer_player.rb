require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    # build a TicTacToeNode from the board stored in the game passed in as an argument
    ttt_node = TicTacToeNode(game.board, mark)

    # iterate through the children of the node we just created
    # if any of the children is a winning_node? for mark passed in method
    # return that node's prev_move_pos because that is the position that causes certain victory
    ttt_node.children.any? { |child| return child.prev_move_pos if child.winning_node?(mark) }

    # if none of the children of the node are winning_node?, PICK ONE that isn't a losing_node?
    # return its prev_move_pos
    ttt_node.children.select { |child| return child.prev_move_pos unless child.losing_node?(mark) }

    # raise an error if there are no non-losing nodes
    raise "No non-losing nodes!"
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
