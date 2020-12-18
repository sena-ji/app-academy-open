class HumanPlayer
  attr_accessor :previous_guess

  # initializer
  def initialize
    @previous_guess = nil
  end

  # instance methods
  def prompt
    print "Enter position of the card you'd like to flip (e.g., '2,3'): "
    gets.chomp.split(',').map(&:to_i)
  end
end