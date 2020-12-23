require_relative "board"
require_relative "player"

class Battleship
  # getter
  attr_reader :board, :player

  # initializer
  def initialize(length)
    @player = Player.new
    @board = Board.new(length)
    @remaining_misses = @board.size * 0.5
  end

  # instance methods
  def start_game
    @board.place_random_ships
    puts "there are: #{@board.num_ships} ships"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
        puts "you lose!"
        return true
    end
    
    false
  end

  def win?
    if @board.num_ships == 0
        puts "you win!"
        return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
        return true
    end

    false
  end

  def turn
    position = @player.get_move

    if @board.attack(position) == false
        @remaining_misses -= 1
    end

    @board.print
    puts "remaining misses: #{@remaining_misses}"
  end
end
