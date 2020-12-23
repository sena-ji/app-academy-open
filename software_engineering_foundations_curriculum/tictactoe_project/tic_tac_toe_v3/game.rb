require_relative "./board"
require_relative "./human_player"
require_relative "./computer_player"

class Game
  # initializer
  def initialize(size, players)
    @players = players.map do |mark, is_computer|
      is_computer ? ComputerPlayer.new(mark) : HumanPlayer.new(mark)
    end
    @current_player = @players.first
    @board = Board.new(size)
  end

  # instance methods
  def switch_turn
    @current_player = @players.rotate!.first
  end

  def play
    while @board.empty_positions?
      @board.print
      legal_choices = @board.legal_positions
      position = @current_player.get_position(legal_choices)
      @board.place_mark(position, @current_player.mark)

      if @board.win?(@current_player.mark)
        print "victory! #{@current_player.mark} wins!"
        return
      else
        self.switch_turn
      end
    end

    print "draw!"
  end
end