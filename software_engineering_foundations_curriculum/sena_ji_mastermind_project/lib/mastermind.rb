require_relative "code"

class Mastermind
  # initializer
  def initialize(length)
    @secret_code = Code.random(length)
  end

  # instance methods
  def print_matches(code_instance)
    puts "exact matches: #{@secret_code.num_exact_matches(code_instance)}"
    puts "near matches: #{@secret_code.num_near_matches(code_instance)}"
  end

  def ask_user_for_guess
    print "Enter a code: "
    code = Code.from_string(gets.chomp)
    self.print_matches(code)
    @secret_code == code
  end
end
