class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8, nil) }

    (0..1).each do |row|
      (1..7).each do |col|
        @rows[row][col] = Piece.new(white)
      end
    end
  end

  def [](pos)

  end

  def []=(pos, val)

  end

  def move_piece(start_pos, end_pos)

  end
end