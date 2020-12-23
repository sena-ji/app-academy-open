require_relative "board.rb"
require_relative "human_player.rb"

class MemoryGame
  # initializer
  def initialize(size = 4)
    @board = Board.new(size)
    @player = HumanPlayer.new
  end

  # instance methods
  def play
    until game_over?
      system("clear")
      @board.render
      position = get_player_input
      make_guess(position)
    end

    puts "You win!"
  end

  def game_over?
    @board.won?
  end

  def get_player_input
    position = nil

    until valid_position?(position)
      position = @player.prompt
    end

    position
  end

  def valid_position?(position)
    position.is_a?(Array) && 
    position.length == 2 && 
    position.all? { |x| x.between?(0, @board.size - 1) }
  end

  def make_guess(guessed_position)
    @board.render

    if @player.previous_guess
      check_card(guessed_position)
    else
      @board[guessed_position].reveal
      @player.previous_guess = guessed_position
    end

    sleep(1)
    @board.render
  end

  def check_card(guessed_position)
    if @board[guessed_position].face_value == @board[@player.previous_guess].face_value
      @board[guessed_position].reveal
      @board[@player.previous_guess].reveal
      @player.previous_guess = nil
    else
      show_incorrect_guess(guessed_position)
      @board[guessed_position].hide
      @board[@player.previous_guess].hide
      @player.previous_guess = nil
    end
  end

  def show_incorrect_guess(guessed_position)
    @board[guessed_position].reveal
    @board.render
  end
end