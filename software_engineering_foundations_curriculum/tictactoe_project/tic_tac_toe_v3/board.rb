class Board
  # initializer
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, '_') }
    @size = n
  end

  # instance methods
  def valid?(position)
    if position[0] > @size-1 || position[0] < 0 || position[1] > @size-1 || position[1] < 0
      return false
    end

    true
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def empty?(position)
    self[position] == '_'
  end

  def place_mark(position, mark)
    if !valid?(position)
      raise "position is not valid!"
    elsif !empty?(position)
      raise "the position is not empty!"
    else
      @grid[position[0]][position[1]] = mark
    end
  end

  def print
    @grid.each { |row| puts row.join(" ") }
  end

  def win_row?(mark)
    if @grid.any? { |row| row.uniq.length == 1 && row.uniq[0] == mark }
      return true
    end

    false
  end

  def win_col?(mark)
    if @grid.transpose.any? { |col| col.uniq.length == 1 && col.uniq[0] == mark }
      return true
    end

    false
  end

  def win_diagonal?(mark)
    down_diagonal = (0...@grid.length).collect { |idx| @grid[idx][idx] }
    if down_diagonal.uniq.length == 1 && down_diagonal.uniq[0] == mark
      return true
    end
  
    width = @grid.length - 1
    up_diagonal = []
    (0...@grid.length).each do |row|
      up_diagonal << @grid[row][width]
      width -= 1
    end
  
    if up_diagonal.uniq.length == 1 && up_diagonal.uniq[0] == mark
      return true
    end
  
    false
  end

  def win?(mark)
    if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
      return true
    end

    false
  end

  def empty_positions?
    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        return true if @grid[row][col] == '_'
      end
    end

    false
  end

  def legal_positions
    indices = (0...@grid.length).to_a
    positions = indices.product(indices)
    positions.select { |pos| empty?(pos) }
  end
end