require 'colorize'

# implement a Tile class to represent each position on the Sudoku board
class Tile
  attr_accessor :value, :given

  # each Tile has a VALUE and is either GIVEN or not
  # you cannot change the value of any GIVEN Tile
  def initialize(value)
    @value = value
    @given = nil
  end

  # since values are integers
  # when we print out, we want to convert to string
  def print_tile
    if @value == "0"
      print ""
    elsif @value != "0" && @given == false
      print @value.to_s.colorize(:blue)
    else
      print @value.to_s.colorize(:red)
    end
  end

  def given?
    @value != "0" ? @given = true : @given = false
  end
end
