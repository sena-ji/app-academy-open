class ComputerPlayer
  # getter
  attr_reader :mark

  # initializer
  def initialize(mark_value)
    @mark = mark_value
  end

  # instance methods
  def get_position(legal_positions)
    comp_pos = legal_positions.sample
    puts "Computer #{self.mark} chose position #{comp_pos.to_s}"
    comp_pos
  end
end