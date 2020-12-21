require 'colorize'
require_relative "board.rb"

class SudokuGame
  attr_reader :board

  # should have an instance variable for the board
  def initialize
    @board = Board.new
  end

  # have methods for managing Board-Player interaction
  # want a play loop that runs until the puzzle is solved
  def play
    until @board.solved?
      system('clear')
      # should render the board
      @board.render

      # prompt the player for input
      pos = get_pos

      # then get both a pos and value from player
      val = get_val

      # then update the tile at pos with the new value
      @board.update_value(pos, val)
    end

    puts "Puzzle is solved!"
  end

  # get and validate input from user
  def get_pos
    prompt_user_pos
    position = gets.chomp.split(' ').map(&:to_i)

    until valid_pos?(position)
      alert_invalid_pos
      prompt_user_pos
      position = gets.chomp.split(' ').map(&:to_i)
    end

    position
  end

  def get_val
    prompt_user_val
    value = gets.chomp.to_i

    until valid_val?(value)
      alert_invalid_val
      prompt_user_val
      value = gets.chomp.to_i
    end

    value
  end

  def prompt_user_pos
    print "Enter a position to place a value on the board like '3 3': "
  end

  def prompt_user_val
    print "Enter the value you would like to place on that position from 1-9: "
  end

  def valid_pos?(pos)
    return false unless pos.length == 2

    pos.all? { |n| (0..8).to_a.include?(n) }
  end

  def valid_val?(val)
    (1..9).to_a.include?(val)
  end

  def alert_invalid_pos
    puts "Invalid position! Must be a position between 0-8 and input 2 numbers for row/col."
  end

  def alert_invalid_val
    puts "Invalid value! Must be a number from 1-9."
  end
end