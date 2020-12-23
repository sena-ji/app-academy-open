class HumanPlayer
  # getter
  attr_reader :mark

  # initializer
  def initialize(mark_value)
    @mark = mark_value
  end

  # instance methods
  def get_position(legal_positions)
    pos_choice = nil
    while !legal_positions.include?(pos_choice)
      print "enter position as two numbers with a space between them like '0 1': "
      position = gets.chomp.split(" ")
      row, col = position
      pos_choice = [row.to_i, col.to_i]

      if !legal_positions.include?(pos_choice)
        puts "not a valid position!"
      end
    end

    pos_choice
  end
end