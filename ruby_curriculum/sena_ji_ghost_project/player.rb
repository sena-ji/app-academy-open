class Player
  # setters and getters
  attr_reader :name

  # initializer
  def initialize(name)
    @name = name
  end

  def guess
    print "#{@name}, choose a letter to add to the fragment: "
    gets.chomp.downcase
  end

  def alert_invalid_guess
    puts "Invalid guess!"
    puts "Guess must be a letter of the alphabet."
    puts "A word from the dictionary must able to be spelled after adding letter."
  end
end