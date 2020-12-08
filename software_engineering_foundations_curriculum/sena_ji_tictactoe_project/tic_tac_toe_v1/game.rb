require_relative "board"
require_relative "human_player"

class Game
  # initializer
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
    @board = Board.new
  end

  # instance methods
  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position
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