require 'colorize'
require_relative "tile.rb"

# should store a GRID of Tiles
class Board
  TILE_VALUES = Array.new
  FILE = "./puzzles/sudoku1.txt"

  attr_accessor :grid

  # puzzles exist as text files, so write a factory method 
  # to read a file and parse it into a 2D array containing Tile instances
  def self.from_file(file)
    read_values = File.read(file).split("\n")

    read_values.each do |value| 
      value.split("").map { |int_value| TILE_VALUES << Tile.new(int_value) }
    end
    
    TILE_VALUES.each_slice(9).to_a.each do |row| 
      row.each_index { |idx| row[idx].given? }
    end
  end

  # define your Board#initialize method to accept such grid as argument
  def initialize
    @grid = Board.from_file(FILE)
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, new_val)
    row, col = pos
    @grid[row][col] = new_val
  end

  # update the value of a Tile at the given position
  def update_value(pos, new_val)
    row, col = pos
    @grid[row][col].value = new_val
  end

  # display current state of board
  def render
    border = "  = = = = = = = = = = ="

    print " "
    (0..8).each do |col|
      print "  " if (col % 3 == 0) && (col != 0)
      print " #{col}"
    end
    puts
    
    (0..8).each do |row| 
      puts border if (row % 3 == 0) && (row != 0)
      print "#{row}"

      (0..8).each do |col|
        print (col % 3 == 0) && (col != 0) ? " | " : " "
        print @grid[row][col].value
      end
      puts
    end
  end

  # to know if game is over
  def solved?
    solved_rows? && solved_cols? && solved_squares?
  end

  def solved_rows?
    @grid.each.all? do |row|
      values = []

      row.each do |tile|
        values << tile.value
      end

      values.map(&:to_i).sort == (1..9).to_a
    end
  end

  def solved_cols?
    @grid.transpose.each.all? do |col|
      values = []

      col.each do |tile|
        values << tile.value
      end

      values.map(&:to_i).sort == (1..9).to_a
    end
  end

  def solved_squares?
    squares = get_squares

    squares.each.all? do |square|
      values = []

      square.flatten.each do |tile|
        values << tile.value
      end
      
      values.map(&:to_i).sort == (1..9).to_a
    end
  end

  def get_squares
    # learned a cool way to get 3x3 chunks of the grid
    # https://stackoverflow.com/questions/41020695/how-do-i-split-a-9x9-array-into-9-3x3-components
    @grid.each_slice(3).map{|stripe| stripe.transpose.each_slice(3).map{|chunk| chunk.transpose}}.flatten(1)
  end
end