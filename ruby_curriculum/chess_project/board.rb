class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
  end
end