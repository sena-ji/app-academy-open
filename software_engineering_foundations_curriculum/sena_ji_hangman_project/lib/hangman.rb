class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  # class method
  def self.random_word
    DICTIONARY.sample
  end

  # initializer
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  # getters
  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  # instance methods
  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ele, idx| indices << idx if char == ele }
    indices
  end

  def fill_indices(char, indices)
    (0...indices.length).each { |idx| @guess_word[indices[idx]] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "That has already been attempted!"
      return false
    end

    @attempted_chars << char

    indices = self.get_matching_indices(char)
    if indices == []
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, indices)
    end

    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN!"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE!"
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end

    false
  end
end
