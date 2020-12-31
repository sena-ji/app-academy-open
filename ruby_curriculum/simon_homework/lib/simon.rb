class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    until @game_over
      show_sequence
      require_sequence
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    @seq.each do |color|
      print color
      sleep(1)
      system 'clear'
    end
  end

  def require_sequence
    user_guess = []
    guess_count = 0

    puts "Enter a sequence of colors for a guess!" 

    while true
      print "> "
      user_choice = gets.chomp
      user_guess << user_choice
      guess_count += 1

      if user_guess == @seq
        round_success_message
        sleep(1)
        system 'clear'
        break
      end

      if user_guess.take(guess_count) != @seq.take(guess_count)
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Round success!"
  end

  def game_over_message
    puts "Game over!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @sequence = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end