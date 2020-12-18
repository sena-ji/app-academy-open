require_relative "card.rb"

class Board
  # getters and setters
  attr_reader :size

  # initializer
  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def populate
    num_pairs = (size**2) / 2
    cards = Card.shuffled_pairs(num_pairs)
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        @grid[i][j] = cards.pop
      end
    end
  end

  def render
    system("clear")
    puts "  #{(0...size).to_a.join(' ')}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def won?
    @grid.each_index do |i|
      @grid[i].each_index do |j|
        return false if @grid[i][j].face_up == false
      end
    end

    true
  end

  def reveal(position)
    if @grid[position].face_up
      puts "Cannot flip card that is already facing up!"
    else
      @grid[position].reveal
    end

    @grid[position].face_value
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end
end