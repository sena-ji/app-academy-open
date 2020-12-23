class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  # getters
  attr_reader :pegs

  # class methods
  def self.valid_pegs?(char_array)
    char_array.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(peg_string)
    Code.new(peg_string.split(""))
  end

  # initializer
  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "does not contain valid pegs!"
    end
  end

  # instance meethods
  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess_instance)
    count = 0

    guess_instance.pegs.each_with_index do |char, idx|
      count += 1 if char == self[idx]
    end
    
    count
  end

  def num_near_matches(guess_instance)
    count = 0

    guess_instance.pegs.each_with_index do |char, idx|
      count += 1 if !(char == self[idx]) && @pegs.include?(char)
    end
    
    count
  end

  def ==(code_instance)
    @pegs == code_instance.pegs
  end
end
