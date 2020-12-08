require_relative "board"
require_relative "human_player"

class Game
  # initializer
  def initialize(size, *player_mark)
    @players = []
    player_mark.each { |mark| @players << HumanPlayer.new(mark) }
    @current_player = @players[0]
    @board = Board.new(size)
  end

  # instance methods
  def switch_turn
    @players.rotate!
    @current_player = @players[0]
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