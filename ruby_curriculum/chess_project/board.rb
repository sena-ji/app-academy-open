require_relative 'piece'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, nil) }

    (0..1).each do |row|
      (0..7).each do |col|
        @rows[row][col] = Piece.new("white")
      end
    end

    (6..7).each do |row|
      (0..7).each do |col|
        @rows[row][col] = Piece.new("white")
      end
    end
  end

  def [](pos)
    row, col = pos

    @rows[row][col]
  end

  def []=(pos, val)
    row, col = pos

    @rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    if @rows[start_pos].nil?
      raise InvalidPieceError.new("There is no piece at #{start_pos}")
    end

    unless @rows[end_pos].nil?
      raise InvalidMoveError.new("The piece cannot move to that position")
    end

    @rows[end_pos] = @rows[start_pos]
    @rows[start_pos] = nil
  end

  class InvalidPieceError < StandardError
    def initialize(message)
      super(message)
    end
  end

  class InvalidMoveError < StandardError
    def initialize(message)
      super(message)
    end
  end
end