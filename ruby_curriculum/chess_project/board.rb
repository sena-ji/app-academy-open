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

  # initially I called the positions as: @rows[start_pos]
  # this resulted in an error because we want to call the instance functions above ([] and []=)
  # so we gotta call with self instead of @rows
  # when we use this board class somewhere else i.e. the Chess class, we can call it as board[start_pos]
  # since board is a Board instance and can utilize those funtions with a name
  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise InvalidPieceError.new("There is no piece at #{start_pos}")
    end

    unless self[end_pos].nil?
      raise InvalidMoveError.new("The selected piece cannot move to that position")
    end

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
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