class HumanPlayer
  # getter
  attr_reader :mark

  # initializer
  def initialize(mark_value)
    @mark = mark_value
  end

  # instance methods
  def get_position
    print "enter position as two numbers with a space between them like '0 1': "
    position = gets.chomp.split(" ")

    if position.length != 2
      raise "invalid position!"
    end

    alphabet = ('a'..'z').to_a
    position.each do |elem|
      if alphabet.include?(elem)
        raise "invalid position!"
      end
    end

    row, col = position
    [row.to_i, col.to_i]
  end
end