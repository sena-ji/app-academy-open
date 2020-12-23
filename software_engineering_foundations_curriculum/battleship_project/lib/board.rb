class Board
  # getter
  attr_reader :size

  # class methods
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  # initializer
  def initialize(num)
    @grid = Array.new(num) { Array.new(num, :N) }
    @size = num * num
  end

  # instance methods
  def [](array_position)
    # unpack the array into multiple variables
    # grabbed technique from Alvin
    row, col = array_position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    count = 0

    (0...@grid.size).map do |row|
      (0...@grid.size).map do |col|
          count += 1 if @grid[row][col] == :S
      end
    end

    count
    # another way of doing this:
    # @grid.flatten.count { |ele| ele == :S }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = @size * 0.25

    while self.num_ships < total_ships 
      random_row = rand(0...@grid.length)
      random_col = rand(0...@grid.length)
      random_pos = [random_row, random_col]
      self[random_pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |elem|
        if elem == :S
          :N
        else
          elem
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
